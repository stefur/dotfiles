#!/bin/bash

shopt -s nullglob globstar

# Find all .gpg files in the password store
password_files=( ~/.password-store/**/*.gpg )
password_files=( "${password_files[@]##*/.password-store/}" )
password_files=( "${password_files[@]%.gpg}" )

# Use fuzzel to select a password file
selected_file=$(printf '%s\n' "${password_files[@]}" | fuzzel.sh -d 2> /dev/null)

# Decrypt the selected password file and extract the otpauth:// string
otpauth_string=$(pass "$selected_file" | grep -o 'otpauth://[^ ]*')

# Extract the secret key from the otpauth:// string
secret_key=$(echo "$otpauth_string" | sed -n 's/.*secret=\([^&]*\).*/\1/p')

# Generate the OTP using oathtool
otp=$(oathtool --base32 --totp --digits=6 "$secret_key")

# Display the generated OTP to the clipboard for 5 seconds
notify-send "OTP" "$otp" -t 5000

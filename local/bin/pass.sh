#!/bin/bash
# pass menu for fuzzel

shopt -s nullglob globstar

password_files=( ~/.password-store/**/*.gpg )
password_files=( "${password_files[@]##*/.password-store/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | fuzzel.sh -d 2> /dev/null)

pass -c "$password"

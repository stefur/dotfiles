#!/bin/bash
sed -i '/^### EMOJIS ###$/q' emojis.sh

curl https://raw.githubusercontent.com/muan/emojilib/main/dist/emoji-en-US.json \
  | jq --raw-output '. | to_entries | .[] | .key + " " + (.value | join(" ") | sub("_"; " "; "g"))' \
  >> emojis.sh

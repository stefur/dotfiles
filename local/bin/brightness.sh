#!/bin/sh

direction="$1"
delta="$2"

current=$(brillo -G)

case "$direction" in
  up)
    new=$(echo "$current + $delta" | bc)
    new=$(echo "$new > 100" | bc -l | grep -q 1 && echo 100 || echo "$new")
    printf "%.0f\n" "$new" > "$WOBSOCK"
    brillo -u 150000 -q -A "$delta"
    ;;
  down)
    new=$(echo "$current - $delta" | bc)
    new=$(echo "$new < 0" | bc -l | grep -q 1 && echo 0 || echo "$new")
    printf "%.0f\n" "$new" > "$WOBSOCK"
    brillo -u 150000 -q -U "$delta"
    ;;
esac

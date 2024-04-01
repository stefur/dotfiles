#!/bin/bash
containers=$(podman container list --format "{{.Names}},{{.RunningFor}},{{.Pid}}" | column -t -N "Name:,Started:,PID:" -s ",")

n=$(( $(echo "$containers" | wc -l) - 1 ))

if [[ n -gt 0 ]]; then
  
    # Map the multiline string to a bash array.
    mapfile -t lines <<<"$containers"

    # Start building the output string, from the firt element of the array (the table headers)
    declare tooltip="${lines[0]}"

    # Remove the first item of the array to prevent a newline at the start
    unset "lines[0]"

    # Iterate over each line in the array
    for line in "${lines[@]}"; do
        # Append the line to the tooltip variable with a newline character
        tooltip="$tooltip\n$line"
    done

    echo "{\"class\": \"running\", \"text\": \"\\uf4b7 $n\", \"tooltip\": \"$tooltip\"}"
    else
    echo "{\"class\": \"not-running\", \"text\": \"\", \"tooltip\": \"\"}"
fi
exit 0
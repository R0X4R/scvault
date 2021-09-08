#!/bin/bash
output=$(echo $1 | awk -F// '{print $NF}' | sed -E 's/[\.|:|\/]+/_/g')
curl -s $1 | anew -q $output.txt

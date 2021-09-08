#!/bin/bash
# "Directory bruteforce using ffuf"
output=$(echo $1 | awk -F// '{print $NF}' | sed -E 's/[\.|:]+/_/g')
wordlist='~/wordlists/wordlist.txt'
if [ ! -f $wordlist ]; then
	wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O ~/wordlists/wordlist.txt 2> /dev/null &> /dev/null
fi

ffuf -u $1/FUZZ -ac -t 100 -mc 200 -r -sf -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" -w ~/wordlists/wordlist.txt -p '0.6-1.2' -maxtime 900 -o $output.json -s 2> /dev/null &> /dev/null
cat $output.json | jq -r '.results[] | .status, .length, .url' 2> /dev/null | xargs -n3 | anew -q $output.txt
rm -rf $output.json

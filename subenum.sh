#!/bin/bash
# Bruteforce subdomains using ffuf and gobuster
if [ ! -f ~/wordlists/subdomains.txt ]; then
	wget https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt -O ~/wordlists/subdomains.txt --no-check-certificate 2> /dev/null &> /dev/null
fi
ffuf -u http://FUZZ.$1/ -t 150 -mc 200 -fl 0 -sf -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" -w ~/wordlists/subdomains.txt -p '0.6-1.2' -maxtime 900 -o ffuf.json 2> /dev/null &> /dev/null
cat ffuf.json | jq -r '.results[] | .host' 2> /dev/null | anew subdomains.txt
gobuster dns -d $1 --no-error -z -q -t 50 -w ~/wordlists/subdomains.txt | sed 's/Found: //g' | anew subdomains.txt
xargs -a wordlists/subdomains.txt -P 20 -I @ bash -c "echo \"@.$1\" | dnsx -silent -t 120 -retry 2 -r wordlists/resolvers.txt"
timeout 50m amass enum -active -brute -w ~/wordlists/subdomains.txt -d $1 -o amass.txt &> /dev/null
cat amass.txt | anew subdomains.txt
rm -rf ffuf.json amass.txt

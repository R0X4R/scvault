<center><img src=".github/logo.png" width="50%"></center>
<h4 align="center">Custom scripts for directory fuzzing, subdomain enumeration and more.</h4>
<p align="center">
<a href="https://ko-fi.com/i/IE1E74SK2W"><img src="https://img.shields.io/badge/buy%20me%20a%20ko--fi%20-donate-red"></a>
<a href="https://github.com/R0X4R/Fuzzy/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://twitter.com/R0X4R/"><img src="https://img.shields.io/badge/twitter-%40R0X4R-blue.svg"></a>
<a href="https://github.com/R0X4R?tab=followers"><img src="https://img.shields.io/badge/github-%40R0X4R-orange"></a>
</p>

---

**Installation** (make sure you have **go** installed)
```bash
$ sudo apt install -y jq golang-go
$ go get -u github.com/ffuf/ffuf
$ go get -u github.com/tomnomnom/anew
$ go install github.com/OJ/gobuster/v3@latest
$ wget https://github.com/OWASP/Amass/releases/download/v3.13.4/amass_linux_amd64.zip -O amass.zip && unzip amass.zip && mv amass_linux_amd64/amass /usr/bin/ && rm -rf amass_linux_amd64/
$ git clone https://github.com/R0X4R/scvault.git && chmod +x scvault/*.sh && mv scvault/*.sh /usr/bin/
```

### Usage

Directory fuzzing:
```bash
$ subfinder -d target.tld -all -silent -threads 200 | httpx -silent -threads 200 | anew -q subdomains.txt
$ interlace -tL subdomains.txt -threads 10 -c "dirfuzz.sh _target_" --silent
```

Subdomain bruteforce:
```bash
$ subenum.sh target.tld
```


### Donate
<a href="https://ko-fi.com/i/IE1E74SK2W"><img src="https://ko-fi.com/img/githubbutton_sm.svg"></a>

### Tools used
<p align="left">
<a href="https://github.com/codingo/Interlace">Interlace:</a> Easily turn single threaded command line applications into a fast, multi-threaded application with CIDR and glob support.<br>

<a href="https://github.com/ffuf/ffuf">FFUF:</a> Fuzz Faster U Fool is a great tool used for fuzzing. It has become really popular lately with bug bounty hunters. Ffuf is used for fuzzing Get and Post data but can also be used for finding hidden files, directories or subdomains.<br>

<a href="https://stedolan.github.io/jq/">jq:</a> jq is like ``sed`` for **JSON data** - you can use it to slice and filter and map and transform structured data with the same ease that ``sed``, ``awk``, ``grep`` and friends let you play with text. jq is written in ``portable C``, and it has zero runtime dependencies. You can download a single binary, ``scp`` it to a far away machine of the same type, and expect it to work. jq can mangle the data format that you have into the one that you want with very little effort, and the program to do so is often shorter and simpler than you'd expect.

<a href="https://github.com/projectdiscovery/subfinder">Subfinder:</a> Subfinder is a subdomain discovery tool that discovers valid subdomains for websites by using passive online sources. It has a simple modular architecture and is optimized for speed. subfinder is built for doing one thing only - passive subdomain enumeration, and it does that very well.<br>

<a href="https://github.com/projectdiscovery/httpx">httpx:</a> httpx is a fast and multi-purpose HTTP toolkit allow to run multiple probers using retryablehttp library, it is designed to maintain the result reliability with increased threads.

<a href="https://github.com/OJ/gobuster">GoBuster: </a>Gobuster is a scanner that looks for existing or hidden web objects. It works by launching a dictionary attack against a web server and analyzing the response.

<a href="https://github.com/OWASP/Amass">Amass: </a>The OWASP Amass Project performs network mapping of attack surfaces and external asset discovery using open source information gathering and active reconnaissance techniques.

**Thanks to all the authors of the tools used**
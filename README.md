<h1 align="center"> Fuzzy </h1>
<h4 align="center">Fuzz for sensitive directories without killing the host using <a href="https://github.com/ffuf/ffuf">FFUF</a></h4>
<p align="center">
<a href="https://ko-fi.com/i/IE1E74SK2W"><img src="https://img.shields.io/badge/buy%20me%20a%20ko--fi%20-donate-red"></a>
<a href="https://github.com/R0X4R/Fuzzy/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://twitter.com/R0X4R/"><img src="https://img.shields.io/badge/twitter-%40R0X4R-blue.svg"></a>
<a href="https://github.com/R0X4R?tab=followers"><img src="https://img.shields.io/badge/github-%40R0X4R-orange"></a>
</p>

---

I have already posted a <a href="https://twitter.com/R0X4R/status/1396847127934889991">tweet</a> about this. We can use `while loop`, `xargs` or `interlace` to use this tool.<br>

<b>What is FFUF</b><br>
Fuzz Faster U Fool is a great tool used for fuzzing. It has become really popular lately with bug bounty hunters. Ffuf is used for fuzzing Get and Post data but can also be used for finding hidden files, directories or subdomains.<br>
Reference: <a href="https://latesthackingnews.com/2019/12/08/ffuf-fuzz-faster-u-fool-an-open-source-fast-web-fuzzing-tool">https://latesthackingnews.com/2019/12/08/ffuf-fuzz-faster-u-fool-an-open-source-fast-web-fuzzing-tool</a>

**Installation** (make sure you have **go** installed)
```bash
$ go get -u github.com/ffuf/ffuf
$ git clone https://github.com/R0X4R/Fuzzy.git
$ cd Fuzzy
$ chmod +x fuzzy && mv /usr/local/bin/
```

### Usage

Using with while loop:
```bash
$ subfinder -d target.com -all -silent -threads 200 | httpx -silent -threads 200 | anew -q subdomains.txt
$ cat subdomains.txt | while read -r line; do fuzzy $line ~/wordlist.txt; done
```

Using with xargs (works more faster):
```bash
$ subfinder -d target.com -all -silent -threads 200 | httpx -silent -threads 200 | anew -q subdomains.txt
$ cat subdomains.txt | xargs -I host -P 30 bash -c "fuzzy host ~/wordlist.txt"
```

Using with [interlace](https://github.com/codingo/Interlace) (for faster results use interlace multi-threading):

```bash
$ subfinder -d target.com -all -silent -threads 200 | httpx -silent -threads 200 | anew -q subdomains.txt
$ interlace -tL subdomains.txt -threads 20 -c "fuzzy _target_ ~/wordlists.txt" 
```

To fetch the results (to view results you need to install [jq](https://stedolan.github.io/jq/) it will parse the json result):

```bash
$ sudo apt install jq

# to filter all the urls with 200 status-code
$ cd results/
$ cat www_target_com.json | jq -r '.results[] | {status:.status, url:.url} | select(.status == 200) | .url'

# to filter all the urls with 403 status-code
$ cd results/
$ cat www_target_com.json | jq -r '.results[] | {status:.status, url:.url} | select(.status == 403) | .url'
```
**Documentation about jq:** [https://stedolan.github.io/jq/tutorial/](https://stedolan.github.io/jq/tutorial/) [https://stedolan.github.io/jq/manual/](https://stedolan.github.io/jq/manual/)

### Donate
<a href="https://ko-fi.com/i/IE1E74SK2W"><img src="https://ko-fi.com/img/githubbutton_sm.svg"></a>

### Tools used
<p align="left">
<a href="https://github.com/codingo/Interlace">Interlace:</a> Easily turn single threaded command line applications into a fast, multi-threaded application with CIDR and glob support.<br>

<a href="https://github.com/ffuf/ffuf">FFUF:</a> Fuzz Faster U Fool is a great tool used for fuzzing. It has become really popular lately with bug bounty hunters. Ffuf is used for fuzzing Get and Post data but can also be used for finding hidden files, directories or subdomains.<br>

<a href="https://stedolan.github.io/jq/">jq:</a> jq is like ``sed`` for **JSON data** - you can use it to slice and filter and map and transform structured data with the same ease that ``sed``, ``awk``, ``grep`` and friends let you play with text. jq is written in ``portable C``, and it has zero runtime dependencies. You can download a single binary, ``scp`` it to a far away machine of the same type, and expect it to work. jq can mangle the data format that you have into the one that you want with very little effort, and the program to do so is often shorter and simpler than you'd expect.

<a href="https://github.com/projectdiscovery/subfinder">Subfinder:</a> Subfinder is a subdomain discovery tool that discovers valid subdomains for websites by using passive online sources. It has a simple modular architecture and is optimized for speed. subfinder is built for doing one thing only - passive subdomain enumeration, and it does that very well.<br>

<a href="https://github.com/projectdiscovery/httpx">httpx:</a> httpx is a fast and multi-purpose HTTP toolkit allow to run multiple probers using retryablehttp library, it is designed to maintain the result reliability with increased threads.

**Thanks to [@ffuf](https://github.com/ffuf/) for making the amzing tool.**

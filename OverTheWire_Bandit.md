# Wargame: Bandit

## Level 0

The password for the next level is stored in a file called **readme** located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

**Commands you may need to solve this level**

ls, cd, cat, file, du, find

### Approach

1. Use the man page on ssh and discovered how to use ssh to login.

```console
ssh bandit0@bandit.labs.overthewire.org -p 2220
```
Then login with the password: bandit0

2. After gaining access, run the following commands to see what is available. Then use the cat command to read the readme file in the terminal to get the flag inside.

```console
bandit0@bandit:~$ ls # shows all files in current directory
readme
bandit0@bandit:~$ cat readme # cat allows me to read a file in terminal
boJ9jbbUNNfktd78OOpsqOltutMc3MY1
```

Flag: boJ9jbbUNNfktd78OOpsqOltutMc3MY1

## Level 1 -> 2

The password for the next level is stored in a file called **-** located in the home directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

**Helpful Reading Material**
[Google Search for “dashed filename”](https://www.google.com/search?q=dashed+filename)
[Advanced Bash-scripting Guide - Chapter 3 - Special Characters](http://tldp.org/LDP/abs/html/special-chars.html)

### Approach

1. logged in using next bandit level with the password being the flag found from the previous challenge. **password: boJ9jbbUNNfktd78OOpsqOltutMc3MY1**

```console
bandit1@bandit.labs.overthewire.org -p 2220
```
2. Tried different ideas to figure out where the file was and how to access it. Not sure the reason yet but brute forcing my way through i was able to find the right command to show the flag.

```console
bandit1@bandit:~$ ls # To see what files/dictionaries i can see
-
bandit1@bandit:~$ cat ./-
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```

**After doing additional research:**
Using `-` as a filename to mean stdin/stdout is a convention that a lot of programs use. It is not a special property of the filename. The kernel does not recognize `-` as special so any system calls referring to `-` as a filename will use `-` literally as the filename.

With bash redirection, - is not recognized as a special filename, so bash will use that as the literal filename.

When cat sees the string `-` as a filename, it treats it as a synonym for stdin. To get around this, you need to alter the string that cat sees in such a way that it still refers to a file called `-.` The usual way of doing this is to prefix the filename with a path `./-,` or `/home/Tim/-.` This technique is also used to get around similar issues where command line options clash with filenames, so a file referred to as `./-e` does not appear as the `-e` command line option to a program.Both **cat < -** and **./-** command will give you the output

Flag: CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

## Level 2 -> 3


The password for the next level is stored in a file called spaces in this filename located in the home directory

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

**Helpful Reading Material**
[Google Search for “spaces in filename”](https://www.google.com/search?q=spaces+in+filename)

### Approach

Ran typical directory reconnaissance to see what files were available. This file included spaces. I knew quotes join filenames with spaces.

```console
bandit2@bandit:~$ ls # check to directory for files
spaces in this filename
bandit2@bandit:~$ file spaces\ in\ this\ filename # ran the file command to see what kind of file this was
spaces in this filename: ASCII text
bandit2@bandit:~$ cat 'spaces in this filename' # used quotes to wrap the filename so it joined the spaces together to ready the file.
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
```
Flag:UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

## Level 3 -> 4


The password for the next level is stored in a **hidden file** in the **inhere** directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Ran typical directory reconnaissance, since the file was hidden i used the `ls -a` command to show all files including hidden ones, then used the `cat` command to read it.

```console
bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cd inhere
bandit3@bandit:~/inhere$ ls -a # the -a allows you to see all objects even those hidden behind with .
.  ..  .hidden
bandit3@bandit:~/inhere$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```

Flag:pIwrPrtPN36QITSp3EQaw936yaFoFgAB

## Level 4 -> 5

The password for the next level is stored in the **only human-readable file in the inhere directory**. Tip: if your terminal is messed up, try the “reset” command.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Ran some reconnaissance on the directories, tried using `ls -h` since it mentioned something about human readability. Did nothing, so i tried using the `file ./filename` to get information on the file, output told me which files were just data and which one was readable.

```console
bandit4@bandit:~/inhere$ ls -h
-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09
bandit4@bandit:~/inhere$ ls -h -l # not sure what this did
total 40K
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file00
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file01
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file02
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file03
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file04
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file05
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file06
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file07
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file08
-rw-r----- 1 bandit5 bandit4 33 May  7  2020 -file09
bandit4@bandit:~/inhere$ ls --human-readable # thought this would be helpful to find out which file had the flag..nope
-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09
bandit4@bandit:~/inhere$ file ./-file00 # checked the file by path for each file and found the ascii text file
./-file00: data
bandit4@bandit:~/inhere$ file ./-file01
./-file01: data
bandit4@bandit:~/inhere$ file ./-file02
./-file02: data
bandit4@bandit:~/inhere$ file ./-file03
./-file03: data
bandit4@bandit:~/inhere$ file ./-file04
./-file04: data
bandit4@bandit:~/inhere$ file ./-file05
./-file05: data
bandit4@bandit:~/inhere$ file ./-file06
./-file06: data
bandit4@bandit:~/inhere$ file ./-file07
./-file07: ASCII text
bandit4@bandit:~/inhere$ file ./-file08
./-file08: data
bandit4@bandit:~/inhere$ file ./-file09
./-file09: data
bandit4@bandit:~/inhere$ cat ./-file07
koReBOKuIDDepwhWk7jZC0RTdopnAYKh
```

Flag:koReBOKuIDDepwhWk7jZC0RTdopnAYKh

## Level 5 -> 6

The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Based on the information provided above, i figured i had to run some sort of search using the `find` and `file` command.Running through the `find` man page i was able to find options to find the file based on the properties mentioned above.

```console
bandit5@bandit:~/inhere$ find -size 1033c -readable # cmd looks for a file that is of 1033 bytes and readable and not executable
bandit5@bandit:~/inhere$ cd maybehere07
bandit5@bandit:~/inhere/maybehere07$ ls
-file1  -file2  -file3  spaces file1  spaces file2  spaces file3
bandit5@bandit:~/inhere/maybehere07$ ls -l
total 36
-rwxr-x--- 1 root bandit5 3663 May  7  2020 -file1
-rw-r----- 1 root bandit5 2488 May  7  2020 -file2
-rwxr-x--- 1 root bandit5 3362 May  7  2020 -file3
-rwxr-x--- 1 root bandit5 4130 May  7  2020 spaces file1
-rw-r----- 1 root bandit5 9064 May  7  2020 spaces file2
-rwxr-x--- 1 root bandit5 1022 May  7  2020 spaces file3
bandit5@bandit:~/inhere/maybehere07$ file ./-file2 # verified file was ASCII
./-file2: ASCII text, with very long lines
bandit5@bandit:~/inhere/maybehere07$ cat .file2
DXjZPULLxYr17uwoI01bNLQbtFemEgo7

```

Flag: DXjZPULLxYr17uwoI01bNLQbtFemEgo7

## Level 6 -> 7

The password for the next level is stored somewhere on the server and has all of the following properties:

owned by user bandit7
owned by group bandit6
33 bytes in size

**Commands you may need to solve this level**
ls, cd, cat, file, du, find, grep

### Approach

Used a similar approach to level 5, man paged the `find ` command to find options for finding files by user and groups. Had to `cd ..` twice to access the entire server. Once there, i did the following.

```console
bandit6@bandit:/$ find -size 33c -group bandit6 -user bandit7
./var/lib/dpkg/info/bandit7.password                <--------------- location of file
bandit6@bandit:/$ cd var/lib/dpkg/info/ # went to that files directory
bandit6@bandit:/var/lib/dpkg/info$ find -size 33c -group bandit6 -user bandit7 # ran a search to confirm location
./bandit7.password
bandit6@bandit:/var/lib/dpkg/info$ cat ./bandit7.password # opened file to get flag, Booyah!
HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

```

Flag: HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

## Level 7 -> 8

The password for the next level is stored in the file **data.txt** next to the word millionth

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

### Approach

I know i'll want to use `grep` because it lets me search through a file. I though of a much easier solution... open the text file using `nano data.txt` then did ctrl + w to search for a word in file.

**millionth       cvX2JJa4CFALtqS87jk27qwqGhBM9plV**

verified that method works, decided to check out grep some more and some of the other commands to find other ways to solve this problem (if i could not open a text editor).

Tried the following commands:

**strings**: strings - print the strings of printable characters in files.
**grep**: grep, egrep, fgrep, rgrep - print lines matching a pattern

Using grep to find the flag worked as well, and requires less typing. I used the following command

```console
bandit7@bandit:~$ grep -e millionth data.txt # -e is the pattern to search for a pattern in the given file
millionth       cvX2JJa4CFALtqS87jk27qwqGhBM9plV 
```

Flag:cvX2JJa4CFALtqS87jk27qwqGhBM9plV

## Level 8 -> 9

The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Piping and Redirection](https://ryanstutorials.net/linuxtutorial/piping.php)

### Approach


After diving into the sort and uniq commands i was able to find `sort` and `uniq -c`. The `uniq -c` command counts up all the lines in a file and gave a count for the number of occurrences found.

```console
sort data.txt | uniq -c # the | (pipe) command allows me to take the output from one command and immediately insert it into another command
```

command will output several lines that have multiple occurrences but one that is unique as well.

FLag:UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

## Level 9 -> 10

The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

### Approach


A similar approach to level 8 using `sort`, `grep`, and potentially `strings`.

I figured i'd try and just run `strings data.txt` to see what strings were actually in the file that i could read. I noted an array of strings after several = characters. I tried that and it worked.

**truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk**

```console
x@nQ
*SF=s
}1:LF
]vur
Emlld
&========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
_Gmz
\Uli,
A5RK
S'$0
<4t",
```

Flag:truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

## Level 10 -> 11

The password for the next level is stored in the file data.txt, which contains base64 encoded data

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)

### Approach


Since the data.txt file was encoded with base64, I used the `base64 data.txt -d` command to decode the text file and ready the flag.

```console
bandit10@bandit:~$ base64 data.txt -d
The password is IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
```

Flag:IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

## Level 11 -> 12

The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Rot13 on Wikipedia](https://en.wikipedia.org/wiki/Rot13)

### Approach

1. download hxtools in a seperate terminal to use rot13 cmd

```console
bandit11@bandit:~$ ls
data.txt
bandit11@bandit:~$ cat data.txt
Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh

echo "Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh" | rot13
The password is 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
```

Flag:5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

## Level 12 -> 13

**Level Goal**
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file

**Helpful Reading Material**
[Hex dump on Wikipedia](https://en.wikipedia.org/wiki/Hex_dump)

### Approach

```console
mkdir /tmp/filename
cp data.txt /tmp/filename
cd /tmp/filename

bandit12@bandit:/tmp/k123$ man xxd
bandit12@bandit:/tmp/k123$ xxd -r data.txt > flag.txt
bandit12@bandit:/tmp/k123$ file flag.txt
flag.txt: gzip compressed data, was "data2.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
```
Use the following sequence to go through and uncompress files using gunzip, bunzip2, and tar -xvf until you get and ACSII file again containing the password.

```console
bandit12@bandit:/tmp/k123$ file data8.bin
data8.bin: gzip compressed data, was "data9.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
bandit12@bandit:/tmp/k123$ mv data8.bin data8.gz
bandit12@bandit:/tmp/k123$ gunzip data8.gz
bandit12@bandit:/tmp/k123$ file data8
data8: ASCII text
bandit12@bandit:/tmp/k123$ cat data8
The password is 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
```

Flag:8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

## Level 13 -> 14

**Level Goal**
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

### Approach

```console
bandit13@bandit:~$ ssh bandit14@localhost -i sshkey.private

bandit14@bandit:~$ whoami
bandit14
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
```

Flag:4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

## Level 14 -> 15

**Level Goal**
The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

### Approach

Checked out Netcat usage on the man page and found that using the following command and pasting in the previous password i was able to find the flag.

```console
bandit14@bandit:~$ nc localhost 30000
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
Correct!
BfMYroe26WYalil77FoDi9qh59eK5xNr
```

Flag:BfMYroe26WYalil77FoDi9qh59eK5xNr

## Level 15 -> 16

The password for the next level can be retrieved by submitting the password of the current level to **port 30001 on localhost** using SSL encryption.

**Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? Use -ign_eof and read the “CONNECTED COMMANDS” section in the manpage. Next to ‘R’ and ‘Q’, the ‘B’ command also works in this version of that command…**

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[Secure Socket Layer/Transport Layer Security on Wikipedia](https://en.wikipedia.org/wiki/Secure_Socket_Layer)
[OpenSSL Cookbook - Testing with OpenSSL](https://www.feistyduck.com/library/openssl-cookbook/online/ch-testing-with-openssl.html)

### Approach

Based on available information i ran a man cmd on openssl and noticed s_client could be useful. I then ran a man cmd on openssl s_client and found the -connect option. So i tried the following command to get the flag.

```console
bandit15@bandit:~$ openssl s_client -connect localhost:30001
<!-- a block of text was returned to me with some connection information. I then pasted the previous flag and got..-->
---
BfMYroe26WYalil77FoDi9qh59eK5xNr
Correct!
cluFn7wTiGryunymYOu4RcffSxQluehd
```

Flag:cluFn7wTiGryunymYOu4RcffSxQluehd

## Level 16 -> 17

**Level Goal**
The credentials for the next level can be retrieved by submitting the password of the current level to **a port on localhost in the range 31000 to 32000**. First find out which of these ports have a server listening on them. Then find out which of those speak SSL and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[Port scanner on Wikipedia](https://en.wikipedia.org/wiki/Port_scanner)

### Approach

I noted port scanning in the helpful reading section and decided to run an nmap scan on localhost

```console
bandit16@bandit:~$ nmap localhost -p31000-32000

Starting Nmap 7.40 ( https://nmap.org ) at 2022-08-11 14:34 CEST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00025s latency).
Not shown: 996 closed ports
PORT      STATE    SERVICE
31046/tcp open     unknown
31518/tcp filtered unknown
31691/tcp open     unknown
31790/tcp open     unknown
31960/tcp open     unknown
```

I then used openssl to try to connect to one of those ports and found port 31790 to be the correct one

```console
bandit16@bandit:~$ openssl s_client -connect localhost:31790
.
.
.
---
cluFn7wTiGryunymYOu4RcffSxQluehd entered password and recieved an RSA private key
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----
```

I saved the key to a file in a new folder in the tmp directory. Then i used chmod 600 to set permissions only to myself. Afterwards i used ssh to gain access to the next level.

```console
bandit16@bandit:/tmp/kyle$ chmod 600 bandit17

bandit16@bandit:/tmp/kyle$ ssh -i bandit17 bandit17@localhost
```

## Level 17 -> 18

**Level Goal**
There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new

**NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19**

**Commands you may need to solve this level**
cat, grep, ls, diff

### Approach

I noticed the diff cmd in the hint for the level so i tried it. Since i'm looking for the change in password.new the top password is the correct one.

```console
bandit17@bandit:~$ diff passwords.new passwords.old
42c42
< kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
---
> w0Yfolrc5bwjS4qw5mq1nnQi6mF03bii
```

Flag:kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd

## Level 18 -> 19

**Level Goal**
The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.

**Commands you may need to solve this level**
ssh, ls, cat

### Approach

The ssh cmd allows me to also give it a command that will execute on the remote host instead of a login shell.

```console
└─$ ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat readme"
This is a OverTheWire game server. More information on http://www.overthewire.org/wargames

bandit18@bandit.labs.overthewire.org's password: 
IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x
```

Flag:IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x

## Level 19 -> 20

**Level Goal**
To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

**Helpful Reading Material**
[setuid on Wikipedia](https://en.wikipedia.org/wiki/Setuid)

### Approach

After some digging, I realized that using the ./bandit20-do with a cmd executes that cmd as a bandit20 usr not bandit19.

```console
bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
```

Flag:GbKksEFF4yrVs6il55v6gwY5aVje5f0j

## Level 20 -> 21

**Level Goal**
There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

NOTE: Try connecting to your own network daemon to see if it works as you think

**Commands you may need to solve this level**
ssh, nc, cat, bash, screen, tmux, Unix ‘job control’ (bg, fg, jobs, &, CTRL-Z, …)

### Approach

I opened a second terminal and ssh'd into bandit20. Once inside i ran `nc -lv -p 8080` to create a local connection on port 8080 to listen to in verbose mode. On my main terminal i connected to my local connection on port 8080 by doing `./suconnect 8080`. On terminal 2 i pasted bandit20s password and recieved bandit 21s password on my main terminal.

```console
<!-- main terminal -->
bandit20@bandit:~$ ./suconnect 8080
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
Read: GbKksEFF4yrVs6il55v6gwY5aVje5f0j
Password matches, sending next password
bandit20@bandit:~$ GbKksEFF4yrVs6il55v6gwY5aVje5f0j


<!-- 2nd terminal -->
bandit20@bandit:~$ nc -lv -p 8080
listening on [any] 8080 ...
connect to [127.0.0.1] from localhost [127.0.0.1] 54966
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr
```

Flag: gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr

## Level 21 -> 22

**Level Goal**
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

**NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Based on the hint, i checked out the cron.d folder and ran the `cat` cmd on several files following the trail until i got to the flag.

```console
bandit21@bandit:~$ cd /etc/cron.d
bandit21@bandit:/etc/cron.d$ ls
cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24
cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root
bandit21@bandit:/etc/cron.d$ ls -la
total 36
drwxr-xr-x  2 root root 4096 Jul 11  2020 .
drwxr-xr-x 87 root root 4096 May 14  2020 ..
-rw-r--r--  1 root root   62 May 14  2020 cronjob_bandit15_root
-rw-r--r--  1 root root   62 Jul 11  2020 cronjob_bandit17_root
-rw-r--r--  1 root root  120 May  7  2020 cronjob_bandit22
-rw-r--r--  1 root root  122 May  7  2020 cronjob_bandit23
-rw-r--r--  1 root root  120 May 14  2020 cronjob_bandit24
-rw-r--r--  1 root root   62 May 14  2020 cronjob_bandit25_root
-rw-r--r--  1 root root  102 Oct  7  2017 .placeholder
bandit21@bandit:/etc/cron.d$ cat cronjob_bandit22
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
bandit21@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit22.sh
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
bandit21@bandit:/etc/cron.d$ cat  /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI
```

Flag: Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI

## Level 22 -> 23

**Level Goal**

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

**NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Similar to the previous level i navigated the various dictionaries and folders and opened up the /usr/bin/cronjob_bandit23.sh file inside i found a bash script..
```bash
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```
Analyizing the script, i noticed that by running line 4 (the mytarget line) and swapping $myname with bandit23 gives me a hash that i then used to read the file containing the flag.

```console
bandit22@bandit:~$ cd /etc/cron.d/
bandit22@bandit:/etc/cron.d$ ls
cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24
cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root
bandit22@bandit:/etc/cron.d$ cat cronjob_bandit23
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
bandit22@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit23.sh
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

bandit22@bandit:/etc/cron.d$ echo I am user bandit23 | md5sum | cut -d ' ' -f 1
8ca319486bfbbc3663ea0fbe81326349
bandit22@bandit:/etc/cron.d$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
```
Flag: jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n

## Level 23 -> 24

**Level Goal**

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

**NOTE: This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level!**
**NOTE 2: Keep in mind that your shell script is removed once executed, so you may want to keep a copy around…**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Really have no clue how the script under `bandit23@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit24.sh` :
```bash
#!/bin/bash

myname=$(whoami) # figures out the current owner

cd /var/spool/$myname # goes to this directory in order to execute cmd
echo "Executing and deleting all scripts in /var/spool/$myname:" 
for i in * .*; # for each index that is of any name . any file extension
do
    if [ "$i" != "." -a "$i" != ".." ]; # as long as its not the parent or child directory
    then # do some things with the current file
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i # remove file
    fi
done
```
relates to anything else. I created a bash script in a tmp folder and created the following script...
```bash
myname=bandit24
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
cat /tmp/$mytarget
```
Instead of running the script with the current user i ran it as if i was bandit24. AFter updating the permissions and running the script i got the flag.
```console
bandit23@bandit:/tmp/kyle$ ./script.sh
Copying passwordfile /etc/bandit_pass/bandit24 to /tmp/ee4ee1703b083edac9f8183e4ae70293
./script.sh: line 8: /tmp/ee4ee1703b083edac9f8183e4ae70293: Permission denied
UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
```

Flag: UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ

**Additional Research**
I looked at other sources for how they got the flag and noticed that information in the cronjob_bandit24.sh script can be used to execute a command.Using the following script and updating privileges using `chmod 777 [script filename]`

```bash
#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/[temp dict name]/password.txt
```

Since the original cronjob executes minute by minute, if the script is executed and you wait a minute the password.txt file will show up in the tmp folder, if you cat into that file from the var/spool directory you will get the flag.

## Level 24 -> 25

**Level Goal**

A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.

### Approach

I went ahead and created a new script that did the following
```bash
#!/bin/bash

password="UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ"

for i in {0000..9999}
do
    echo $password $i
done
```
After that i output the results to a txt file and then i connected to the localhost `nc localhost 30002` and redirected the output from the text file to the request from the connection.

```console
bandit24@bandit:nc lkocalhost 30002 < output.txt
...
Correct!
The password of user bandit25 is uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG
```

Flag: uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG

## Level 25 -> 26

**Level Goal**
Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is not /bin/bash, but something else. Find out what it is, how it works and how to break out of it.

**Commands you may need to solve this level**
ssh, cat, more, vi, ls, id, pwd

### Approach

in the home directory i found an sshkey that i used to try to connect to bandit26  `ssh -i bandit26.sshkey bandit26@localhost`. Connection closes out instantly with no shell. I check out the `/etc/passwd` file to see file store information. I noticed bandit26 isn't `/bin/bash` but `/usr/bin/showtext`.  I ran the file cmd to see whta it was and then i ran the cat cmd to see what type of script it was. Using the more cmd i can execute commands on the connection page to show more(I have to zoom in really close on the terminal to have the ability to execute on the more cmd). On the more man page is talks about using the v cmd to enter edit mode, once inside the vim editor i dod `:r /etc/bandit_pass/bandit26` and got the flag.

Flag:  5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z 

Level 26 → Level 27

**Level Goal**
Good job getting a shell! Now hurry and grab the password for bandit27!

**Commands you may need to solve this level**
ls

### Approach

Similar approach to the previous level, however now that your in the editor you want to run a few commands in order to find the flag.
```console
:set shell=/bin/bash #change the type of shell used
:!ls -la #list the files in the directory
total 36
drwxr-xr-x  3 root     root     4096 Oct 16 14:00 .
drwxr-xr-x 41 root     root     4096 Oct 16 14:00 ..
-rwsr-x---  1 bandit27 bandit26 7296 Oct 16 14:00 bandit27-do
-rw-r--r--  1 root     root      220 May 15  2017 .bash_logout
-rw-r--r--  1 root     root     3526 May 15  2017 .bashrc
-rw-r--r--  1 root     root      675 May 15  2017 .profile
drwxr-xr-x  2 root     root     4096 Oct 16 14:00 .ssh
-rw-r-----  1 bandit26 bandit26  258 Oct 16 14:00 text.txt
:!./bandit27-do cat /etc/bandit_pass/bandit27 #bandit27-do is similar to sunconnect from a previous level where it can be used to access the information restricted to a user.                                                                   
3ba3118a22e93127a4ed485be72ef5ea
```

Flag: 3ba3118a22e93127a4ed485be72ef5ea

# Level 27 -> 28

**Level Goal**
There is a git repository at ssh://bandit27-git@localhost/home/bandit27-git/repo. The password for the user bandit27-git is the same as for the user bandit27.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

using the git clone cmd i'm able to download the repo and access it. I first make a tmp directory and cd into it. Once inside i run `bandit27@bandit:/tmp/kyle2$ git clone ssh://bandit27-git@localhost/home/bandit27-git/repo`.

```console
bandit27@bandit:/tmp/kyle2$ ls
repo
bandit27@bandit:/tmp/kyle2$ ls -la repo
total 16
drwxr-sr-x 3 bandit27 root 4096 Aug 17 00:19 .
drwxr-sr-x 3 bandit27 root 4096 Aug 17 00:19 ..
drwxr-sr-x 8 bandit27 root 4096 Aug 17 00:19 .git
-rw-r--r-- 1 bandit27 root   68 Aug 17 00:19 README
bandit27@bandit:/tmp/kyle2$ cd repo
bandit27@bandit:/tmp/kyle2/repo$ ls
README
bandit27@bandit:/tmp/kyle2/repo$ cat README
The password to the next level is: 0ef186ac70e04ea33b4c1853d2526fa2
```

Flag: 0ef186ac70e04ea33b4c1853d2526fa2

# Level 27 -> 28

**Level Goal**
There is a git repository at ssh://bandit28-git@localhost/home/bandit28-git/repo. The password for the user bandit28-git is the same as for the user bandit28.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

CLone the repo to a tmp work space then check the readme file, noticed the password was not visible. ran git log to see changes to the repo and then used git show with the commit hash to go back to a previous commit to uncover the password.

```console
bandit28@bandit:/tmp/kyle10$ git clone ssh://bandit28-git@localhost/home/bandit28-git/repo
...
bandit28@bandit:/tmp/kyle10$ ls
repo
bandit28@bandit:/tmp/kyle10$ cd repo
bandit28@bandit:/tmp/kyle10/repo$ ls
README.md
bandit28@bandit:/tmp/kyle10/repo$ cat README.md 
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: xxxxxxxxxx

bandit28@bandit:/tmp/kyle10/repo$ git log
commit edd935d60906b33f0619605abd1689808ccdd5ee
Author: Morla Porla <morla@overthewire.org>
Date:   Thu May 7 20:14:49 2020 +0200

    fix info leak

commit c086d11a00c0648d095d04c089786efef5e01264
Author: Morla Porla <morla@overthewire.org>
Date:   Thu May 7 20:14:49 2020 +0200

    add missing data

commit de2ebe2d5fd1598cd547f4d56247e053be3fdc38
Author: Ben Dover <noone@overthewire.org>
Date:   Thu May 7 20:14:49 2020 +0200

    initial commit of README.md
bandit28@bandit:/tmp/kyle10/repo$ git show c086d11a00c0648d095d04c089786efef5e01264
commit c086d11a00c0648d095d04c089786efef5e01264
Author: Morla Porla <morla@overthewire.org>
Date:   Thu May 7 20:14:49 2020 +0200

    add missing data

diff --git a/README.md b/README.md
index 7ba2d2f..3f7cee8 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for level29 of bandit.
 ## credentials
 
 - username: bandit29
-- password: <TBD>
+- password: bbc96594b4e001778eee9975372716b2
```

Flag: bbc96594b4e001778eee9975372716b2

Level 29 → Level 30
**Level Goal**
There is a git repository at ssh://bandit29-git@localhost/home/bandit29-git/repo. The password for the user bandit29-git is the same as for the user bandit29.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

This involves working through branches. Notice that the current master branch doesn't have anything for us so we check for other branches using `git branch -a` I then checked out a different branch using `git checkout remotes/origin/dev`. I ran gitt log and noticed data was added for development. Ran `git show` on that commit hash and got the flag.

```commit
bandit29@bandit:/tmp/kyle11/repo$ cat README.md 
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: <no passwords in production!>

bandit29@bandit:/tmp/kyle11/repo$ git branch
* master
bandit29@bandit:/tmp/kyle11/repo$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/dev
  remotes/origin/master
  remotes/origin/sploits-dev
bandit29@bandit:/tmp/kyle11/repo$ git checkout remotes/origin/dev
Note: checking out 'remotes/origin/dev'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at bc83328... add data needed for development
bandit29@bandit:/tmp/kyle11/repo$ git log
commit bc833286fca18a3948aec989f7025e23ffc16c07
Author: Morla Porla <morla@overthewire.org>
Date:   Thu May 7 20:14:52 2020 +0200

    add data needed for development

commit 8e6c203f885bd4cd77602f8b9a9ea479929ffa57
Author: Ben Dover <noone@overthewire.org>
Date:   Thu May 7 20:14:51 2020 +0200

    add gif2ascii

commit 208f463b5b3992906eabf23c562eda3277fea912
Author: Ben Dover <noone@overthewire.org>
Date:   Thu May 7 20:14:51 2020 +0200

    fix username

commit 18a6fd6d5ef7f0874bbdda2fa0d77b3b81fd63f7
Author: Ben Dover <noone@overthewire.org>
Date:   Thu May 7 20:14:51 2020 +0200

    initial commit of README.md
bandit29@bandit:/tmp/kyle11/repo$ git show bc833286fca18a3948aec989f7025e23ffc16c07
commit bc833286fca18a3948aec989f7025e23ffc16c07
Author: Morla Porla <morla@overthewire.org>
Date:   Thu May 7 20:14:52 2020 +0200

    add data needed for development

diff --git a/README.md b/README.md
index 1af21d3..39b87a8 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for bandit30 of bandit.
 ## credentials
 
 - username: bandit30
-- password: <no passwords in production!>
+- password: 5b90576bedb2cc04c86a9e924ce42faf
```

Flag: 5b90576bedb2cc04c86a9e924ce42faf

Level 30 → Level 31

**Level Goal**
There is a git repository at ssh://bandit30-git@localhost/home/bandit30-git/repo. The password for the user bandit30-git is the same as for the user bandit30.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Tried all the various methods prior and nothing changed. went into the .git directory and checked out the packer-ref file, noticed a different commit hash, tried it out and found the flag.

```console
bandit30@bandit:~$ mkdir /tmp/kyle12; cd /tmp/kyle12;git clone ssh://bandit30-git@localhost/home/bandit30-git/repo; cd repo
Cloning into 'repo'...
bandit30@bandit:/tmp/kyle12/repo$ ls
README.md
bandit30@bandit:/tmp/kyle12/repo$ cat README.md 
just an epmty file... muahaha
bandit30@bandit:/tmp/kyle12/repo$ git show
commit 3aefa229469b7ba1cc08203e5d8fa299354c496b
Author: Ben Dover <noone@overthewire.org>
Date:   Thu May 7 20:14:54 2020 +0200

    initial commit of README.md

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..029ba42
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+just an epmty file... muahaha
bandit30@bandit:/tmp/kyle12/repo$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
bandit30@bandit:/tmp/kyle12/repo$ git branch
* master
bandit30@bandit:/tmp/kyle12/repo$ ls -la
total 16
drwxr-sr-x 3 bandit30 root 4096 Aug 17 03:39 .
drwxr-sr-x 3 bandit30 root 4096 Aug 17 03:38 ..
drwxr-sr-x 8 bandit30 root 4096 Aug 17 03:39 .git
-rw-r--r-- 1 bandit30 root   30 Aug 17 03:39 README.md
bandit30@bandit:/tmp/kyle12/repo$ cd .git
bandit30@bandit:/tmp/kyle12/repo/.git$ ls
branches  config  description  HEAD  hooks  index  info  logs  objects  packed-refs  refs
bandit30@bandit:/tmp/kyle12/repo/.git$ cat config
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = ssh://bandit30-git@localhost/home/bandit30-git/repo
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
bandit30@bandit:/tmp/kyle12/repo/.git$ cat packed-refs 
# pack-refs with: peeled fully-peeled 
3aefa229469b7ba1cc08203e5d8fa299354c496b refs/remotes/origin/master
f17132340e8ee6c159e0a4a6bc6f80e1da3b1aea refs/tags/secret
bandit30@bandit:/tmp/kyle12/repo/.git$ git show f17132340e8ee6c159e0a4a6bc6f80e1da3b1aea
47e603bb428404d265f59c42920d81e5
```

Flag:47e603bb428404d265f59c42920d81e5

Level 31 → Level 32
**Level Goal**
There is a git repository at ssh://bandit31-git@localhost/home/bandit31-git/repo. The password for the user bandit31-git is the same as for the user bandit31.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

```console
bandit31@bandit:~$ mkdir /tmp/kyle13
bandit31@bandit:~$ cd /tmp/kyle13
bandit31@bandit:/tmp/kyle13$ git clone ssh://bandit31-git@localhost/home/bandit31-git/repo
Cloning into 'repo'...
bandit31@bandit:/tmp/plop12345$ cd repo/
bandit31@bandit:/tmp/plop12345/repo$ ls
README.md
bandit31@bandit:/tmp/kyle13/repo$ cat README.md 
This time your task is to push a file to the remote repository.

Details:
    File name: key.txt
    Content: 'May I come in?'
    Branch: master

bandit31@bandit:/tmp/kyle13/repo$ echo "May I come in?">key.txt
bandit31@bandit:/tmp/kyle13/repo$ git add -f key.txt
bandit31@bandit:/tmp/kyle13/repo$ git commit -m key.txt
[master 1e7c122] key.txt
 1 file changed, 1 insertion(+)
 create mode 100644 key.txt
bandit31@bandit:/tmp/kyle13/repo$ git push origin master
bandit31-git@localhost password: 

Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 320 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
remote: ### Attempting to validate files... ####
remote: 
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote: 
remote: Well done! Here is the password for the next level:
remote: 56a9bf19c63d650ce78e6ec0354ee45e
remote: 
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote: 
To ssh://localhost/home/bandit31-git/repo
 ! [remote rejected] master -> master (pre-receive hook declined)
error: failed to push some refs to 'ssh://bandit31-git@localhost/home/bandit31-git/repo'
```

Flag: 56a9bf19c63d650ce78e6ec0354ee45e

Level 32 → Level 33

After all this git stuff its time for another escape. Good luck!

**Commands you may need to solve this level**
sh, man

### Approach

get an interactive shell by inserting $0 in the fake shell, then we run vim end read the password for the next level.

```console
WELCOME TO THE UPPERCASE SHELL
>> ls
sh: 1: LS: not found
>> $0
$ vim

# In vim enter the following command :
# :r /etc/bandit_pass/bandit33

c9c3199ddf4121b10cf581a98d51caee
```

Flag: c9c3199ddf4121b10cf581a98d51caee

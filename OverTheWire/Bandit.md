# OverTheWire Wargame: Bandit

>The Bandit wargame is aimed at absolute beginners. It will teach the basics needed to be able to play other wargames.

> Completed: 08/16/2022

## Level 0 to 1

The password for the next level is stored in a file called **readme** located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

I used the `ssh` cmd to log in to the shell. I then used the `ls` cmd to see what files were in the home directory. Using the `cat` cmd I was able to read what was inside the file.

```console
ssh bandit0@bandit.labs.overthewire.org -p 2220

bandit0@bandit:~$ ls # shows all files in current directory
readme
bandit0@bandit:~$ cat readme # cat allows me to read a file in terminal
boJ9jbbUNNfktd78OOpsqOltutMc3MY1
```

**Flag: boJ9jbbUNNfktd78OOpsqOltutMc3MY1**

---

## Level 1 to 2

The password for the next level is stored in a file called **-** located in the home directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

**Helpful Reading Material**
[Google Search for “dashed filename”](https://www.google.com/search?q=dashed+filename)
[Advanced Bash-scripting Guide - Chapter 3 - Special Characters](http://tldp.org/LDP/abs/html/special-chars.html)

### Approach

I used the `ls` cmd and noticed only one object in the home directory. I used the `cat` and `./` cmd on the object to access it.

```console
bandit1@bandit:~$ ls 
-
bandit1@bandit:~$ cat ./-
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```

**Side Note**
Using `-` as a filename to mean stdin/stdout is a convention that a lot of programs use. It is not a special property of the filename. The kernel does not recognize `-` as special so any system calls referring to `-` as a filename will use `-` literally as the filename.

With bash redirection, - is not recognized as a special filename, so bash will use that as the literal filename.

When cat sees the string `-` as a filename, it treats it as a synonym for stdin. To get around this, you need to alter the string that cat sees in such a way that it still refers to a file called `-.` The usual way of doing this is to prefix the filename with a path `./-,` or `/home/Tim/-.` This technique is also used to get around similar issues where command line options clash with filenames, so a file referred to as `./-e` does not appear as the `-e` command line option to a program.Both **cat < -** and **./-** command will give you the output

**Flag: CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9**

---

## Level 2 to 3

The password for the next level is stored in a file called **spaces in this filename** located in the home directory

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

**Helpful Reading Material**
[Google Search for “spaces in filename”](https://www.google.com/search?q=spaces+in+filename)

### Approach

I knew from experience files with spaces could be used but had to be encapsulated in quotes.

```console
bandit2@bandit:~$ ls
spaces in this filename
bandit2@bandit:~$ cat 'spaces in this filename'
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
```

**Flag:UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK**

---

## Level 3 to 4

The password for the next level is stored in a **hidden file** in the **inhere** directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

I used the `cd` cmd to change directories. Since the file was hidden I used the `ls -a` cmd which listed all files and directories in the current directory. I then used the `cat` cmd to read from the hidden file.

Ran typical directory reconnaissance, since the file was hidden I used the `ls -a` command to show all files including hidden ones, then used the `cat` command to read it.

```console
bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cd inhere
bandit3@bandit:~/inhere$ ls -a
.  ..  .hidden
bandit3@bandit:~/inhere$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```

**Flag:pIwrPrtPN36QITSp3EQaw936yaFoFgAB**

---

## Level 4 to 5

The password for the next level is stored in the **only human-readable file in the inhere directory**. Tip: if your terminal is messed up, try the “reset” command.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

I used the `file` cmd on each to find out which file contained the ASCII text.

```console
bandit4@bandit:~/inhere$ ls -h
-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09
bandit4@bandit:~/inhere$ file ./-file00
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

**Flag:koReBOKuIDDepwhWk7jZC0RTdopnAYKh**

---

## Level 5 to 6

The password for the next level is stored in a file somewhere under the inhere directory and has all the following properties:

- human-readable
- 1033 bytes in size
- not executable

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

I used the `find` and `file` cmds. The `find` cmd has options for looking for files of a specific size and whether they are human-readable.

```console
bandit5@bandit:~/inhere$ find -size 1033c -readable 
bandit5@bandit:~/inhere$ cd maybehere07
bandit5@bandit:~/inhere/maybehere07$ ls
-file1  -file2  -file3  spaces file1  spaces file2  spaces file3
bandit5@bandit:~/inhere/maybehere07$ file ./-file2
./-file2: ASCII text, with very long lines
bandit5@bandit:~/inhere/maybehere07$ cat .file2
DXjZPULLxYr17uwoI01bNLQbtFemEgo7

```

**Flag: DXjZPULLxYr17uwoI01bNLQbtFemEgo7**

---

## Level 6 to 7

The password for the next level is stored somewhere on the server and has all the following properties:

- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

**Commands you may need to solve this level**
ls, cd, cat, file, du, find, grep

### Approach

I ran the `find -seze 33c -gtoup bandit6 -user bandit7` cmd and located a file in a different directory that matched my parameters. I then `cd` into that folder and verified by running the `find` cmd again. Furthermore, I then ran the `cat` cmd to find the flag.

```console
bandit6@bandit:/$ find -size 33c -group bandit6 -user bandit7
./var/lib/dpkg/info/bandit7.password
bandit6@bandit:/$ cd var/lib/dpkg/info/ # went to that files directory
bandit6@bandit:/var/lib/dpkg/info$ find -size 33c -group bandit6 -user bandit7
./bandit7.password
bandit6@bandit:/var/lib/dpkg/info$ cat ./bandit7.password
HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs
```

**Flag: HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs**

---

## Level 7 to 8

The password for the next level is stored in the file *data.txt* next to the word millionth

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

### Approach

I knew I could use `grep` to search for keywords, however I decided to just open the file using `nano data.txt` and then use the `ctrl+w` cmd to search for the word millionth.

I used the `grep -e` cmd to match for a specific pattern, in this case "millionth".

```console
bandit7@bandit:~$ grep -e millionth data.txt
millionth       cvX2JJa4CFALtqS87jk27qwqGhBM9plV 
```

**Flag:cvX2JJa4CFALtqS87jk27qwqGhBM9plV**

---

## Level 8 to 9

The password for the next level is stored in the file *data.txt* and is the only line of text that occurs only once

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Piping and Redirection](https://ryanstutorials.net/linuxtutorial/piping.php)

### Approach

I used the `sort` and `uniq -c` cmds. The `uniq -c` cmd counts up all the lines in a file and gives a count for the number of occurrences found. The `|` (pipe) cmd allows me to take the output from one command and immediately insert it into another command.

```console
bandit8@bandit:~$ sort data.txt | uniq -c
     10 07KC3ukwX7kswl8Le9ebb3H3sOoNTsR2
     10 0efnqHY1ZTNRu4LsDX4D73DsxIQq7RuJ
     10 0N65ZPpNGkUJePzFxctCRZRXVrCbUGfm
     10 0Xo6DLyK5izRqEtBA7sW2SRmlAixWYSg
     10 10XitczY5Dz7UMoseKIeFWSzzwQrylfw
     10 1ETSsKgjfQj1cJeFzXLJWzKzza3iWcJa
     10 1T6qw9I32d71cS3TTvwmVp1WsxPFDJ9I
     10 2bFz9F0yRwxGzVCZ4Er04bk00qfUrzWb
     10 2CxmtCkpNL5ZjuoNzAtShkPXf5T43W7s
     10 337o85y4OymIh99WPUtotkb114evfAkC
     10 33xpPQhjt4Q2mqtX4sCVRwH2Zyh82E8R
     10 4SMqyZZztep75cte6xxKpVL49pKUkV8N
     10 5AdqWjoJOEdx5tJmZVBMo0K2e4arD3ZW
     10 5cO8XuoQWrzsyeOWDht8zgUIVWSRDaeC
     10 6PF22p6O8TphCTZot9ApZx8VfGuo8rd5
     10 7KaMzgnYMUeMISP9vuT3Dvsc06qfqa9u
     10 7uhj3nhe4AS0esnnEZHBAZN67fJ8BFjM
     10 8jtZmvqp9PTi8tp1oybBM663NQH3fhII
     10 8NtHZnWzCA8HswoJSCU7Ojg8nP3eKpsA
     10 aR2QhaBoDMncvJqPWkvLXMzEx9meBIbX
     10 BccauS9LeE8NUz4HVLXUwE8M1LWisPlG
     10 bRnktwNdxFy2RPZIshXJikswwEzJGvJ9
     10 cIPbot7oYveUPNxDMhv1hiri50CqpkTG
     10 cR6riSWC0ST7ALZ2i1e47r3gc0QxShGo
     10 CUqLkjIo0Jz9fNgrjPxiPa7PGGC1wpTQ
     10 dGnfD2LoqTiO1MBf2vmqw1KKEWSHfMKJ
     10 dqd5wTVO1cVPJoEY7GGkCdGxG6ZYqW98
     10 dqnvnNxL4QR3ALq95ckhZwEpl77cRgF4
     10 DqPqVp8YCjZ1vFsclwRTg13EuSc2D52X
     10 dV0aGGhk6mB4ZJX1aTTluAUIvLWToTYr
     10 DxxLvJl6cGHXLT7OW4xqS7Qrfny1K01l
     10 e5HFl4ur1rAxPPv2mHzg1uYKMuos4fwp
     10 Ef509iQpb5gQJsjz5dMXLxpeAfkbLOrw
     10 eTHlmI3pFZ4FQASs32Dm0ETVZWHlP0I1
     10 f0tri5KLH5eiTU0zQOqWvXTsrl1ekqnU
     10 f6ZuiZizTliaMOkVYXZMudtaReSYMnkP
     10 flyKxCbHB8uLTaIB5LXqQNuJj3yj00eh
     10 g1VkH2pk3cmr6aY4np1Dcpm0HF7G9IDT
     10 g9xRXSlVNiV4EhUAl1p6uPUWcyEewDK6
     10 gqyF9CW3NNIiGW27AtWVNPqp3i1fxTMY
     10 h2IsJoN6fe0ne0qrTQxeiu0P44hMWWbk
     10 hA6Ofhj75FPgqnCKEJ9g6pLSKapxxmGC
     10 Hq6uxRAkKPNLnH6eRSFDzXtvVt0CSsee
     10 I3fc578VLa7mOQ1t9zArPPOPY7aDVBcJ
     10 iIaOHQG7ZLdimomwMQaGIF7vib1RmXBh
     10 IkAAyqo1rCrxdY8qH0FfxXkRTTO2GNSf
     10 iKiMcQpNMn2ImOASX39XBUR8XfApdmsj
     10 InU7h0xhZh4SMMOMvlnsq03pz0k9J5FX
     10 iwE0KTeKQ8PWihqvjUnpu52YZeIO8Pqb
     10 J6Lzp6ZqTJsOuJRTXcvhwKfM0KK3Xtbl
     10 K9D1CLsVCdkodgvJJIt1oHIaiOY1h8hg
     10 KASHOxc1NxaM8caXUw5MHCkddANXOkCu
     10 khecG2RClunkhrgmq4UNB26N5F1yiUwL
     10 kJTBMD8k9OHyXwZ2aJMQkV23u0gyuoIO
     10 KLu6irnqFwhOKnVoTwuoT9e5t6oxYQwv
     10 KrDVVORXLPfRhfnRmmuP3OnVHWKDMSM8
     10 kUbOkhsIw6GSp0WI2YUo1Q3hDxFU0iQn
     10 l1I3Red7uSH9n30OylHP2hQDbOU0qGaq
     10 l2lECnJkQk8EBl6IO3gHUlnjoCTF1has
     10 LfrBHfAh0pP9bgGAZP4QrVkut3pysAYC
     10 Lg4vWWvEY7s0bG6BRiA35AHzo2gM6lHg
     10 mpgNGRH628hTQxajScbagkxaPKklUhjn
     10 mzOW32HQZi14kwrdeiquO1LCbyaOtbiT
     10 nJRb4MipHMdTmFylFc1NlqmywgxDSdoI
     10 NLWvtQvL7EaqBNx2x4eznRlQONULlCYZ
     10 NOdH1kFWibx4XnNaJoLFmghBn7oIs5hb
     10 ojGabNG5NJ9ppKUBXGr8lwMRRS5GuiA5
     10 OZ1wgx8bDI0vFOFxDQH32eMMcIPiIuPE
     10 PfbMe4Xb3mw5mJmabIbKAXKCU7zynDHl
     10 PQKOeIQwTw490Y8yobuxZAOL4cNmVo1D
     10 PSdVQSeUUBPRZD58WWP0OXLKxSgU3RxX
     10 ptb5ZW8TcgD3U6gOGCcN31xCDGIoQSEa
     10 qaWWAOOquC3yHnfJI4zvPWzCBdfHQ8wa
     10 RMiSPoAvF7WhgIcOdSQR2r6Zx0DNS5UW
     10 s1603Q2r4RPKqyoA8cspIRk0VdgEmFC3
     10 SA05uWMVCao2rzS8YRqUXh19SvnDpuOl
     10 SHMAMUEzQe4mV7SJpETTZFsyNRJsZE2k
     10 si952kS1y6pt4AFenmm0oIp8n7W5d3bd
     10 sYSokIATVvFUKU4sAHTtMarfjlZWWj5i
     10 SzwgS2ADSjP6ypOzp2bIvdqNyusRtrHj
     10 TKUtQbeYnEzzYIne7BinoBx2bHFLBXzG
     10 TThRArdF2ZEXMO47TIYkyPPLtvzzLcDf
     10 tVW9iY1Ml0uHPK4usZnN8oZXbjRt2ATY
     10 U0NYdD3wHZKpfEg9qGQOLJimAJy6qxhS
     10 UASW6CQwD6MRzftu6FAfyXBK0cVvnBLP
     10 UJiCNvDNfgb3fcCj8PjjnAXHqUM63Uyj
     10 UjsVbcqKeJqdCZQCDMkzv6A9X7hLbNE4
      1 UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
     10 UVnZvhiVQECraz5jl8U14sMVZQhjuXia
     10 V2d9umHiuPLYLIDsuHj0frOEmreCZMaA
     10 v9zaxkVAOdIOlITZY2uoCtB1fX2gmly9
     10 VkBAEWyIibVkeURZV5mowiGg6i3m7Be0
     10 w4zUWFGTUrAAh8lNkS8gH3WK2zowBEkA
     10 WBqr9xvf6mYTT5kLcTGCG6jb3ex94xWr
     10 wjNwumEX58RUQTrufHMciWz5Yx10GtTC
     10 X1JHOUkrb4KgugMXIzMWWIWvRkeZleTI
     10 XyeJdbrUJyGtdGx8cXLQST0pwu5cvpcA
     10 yo0HbSe2GM0jJNhRQLxwoPp7ayYEmRKY
     10 ySvsTwlMgnUF0n86Fgmn2TNjkSOlrV72
     10 Z9OC6DQpppreChPhwRJJV9YYTtrxNVcO
     10 zdd2ctVveROGeiS2WE3TeLZMeL5jL7iM
```

**Flag:UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR**

---

## Level 9 to 10

The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

### Approach

I used the `string data.txt` cmd to find all the lines containing strings then I `|` the output to the `grep -e =` cmd to search for lines containing an "=" sign.

```console
bandit9@bandit:~$ strings data.txt | grep -e =
========== the*2i"4
=:G e
========== password
<I=zsGi
Z)========== is
A=|t&E
Zdb=
c^ LAh=3G
*SF=s
&========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
S=A.H&^
```

**Flag:truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk**

---

## Level 10 to 11

The password for the next level is stored in the file *data.txt*, which contains base64 encoded data

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

**Flag:IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR**

---

## Level 11 to 12

The password for the next level is stored in the file *data.txt*, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Rot13 on Wikipedia](https://en.wikipedia.org/wiki/Rot13)

### Approach

I downloaded `hxtools` on a separate terminal to use its `rot13` cmd. I copied the line from the data.txt file and pasted it into an echo string (since I couldn't access the data.txt file in the other terminal) and then `|` it into the `rot13` cmd.

```console
bandit11@bandit:~$ cat data.txt
Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh

echo "Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh" | rot13
The password is 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
```

**Flag:5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu**

---

## Level 12 to 13

The password for the next level is stored in the file *data.txt*, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under **/tmp** in which you can work using mkdir. For **example: mkdir /tmp/myname123**. Then copy the datafile using cp, and rename it using mv (read the manpages!)

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file

**Helpful Reading Material**
[Hex dump on Wikipedia](https://en.wikipedia.org/wiki/Hex_dump)

### Approach

I created a temp folder then copied and moved the data.txt file to it. Using the `file` cmd I knew which compression cmd to use to decompress the file. Once decompressed I had to use the `mv` cmd to change the file extension and repeat those steps until I found the flag.

```console
mkdir /tmp/filename
cp data.txt /tmp/filename
cd /tmp/filename

bandit12@bandit:/tmp/k123$ man xxd
bandit12@bandit:/tmp/k123$ xxd -r data.txt > flag.txt
bandit12@bandit:/tmp/k123$ file flag.txt
flag.txt: gzip compressed data, was "data2.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
```

I used the following cmds `gunzip`, `bunzip2`, and `tar -xvf` until I eventually got the flag.

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

**Flag:8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL**

---

## Level 13 to 14

The password for the next level is stored in */etc/bandit_pass/bandit14* and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. **Note: localhost is a hostname that refers to the machine you are working on**

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

### Approach

I ran the `ssh` cmd with the user being bandit14 and the hostname being local host (see man page) then used `-i` for the file containing the sshkey. I then confirmed which user I was with the `whoami` cmd and then looked into the */etc/bandit_pass/bandit14* file for the flag.

```console
bandit13@bandit:~$ ssh bandit14@localhost -i sshkey.private
...
bandit14@bandit:~$ whoami
bandit14
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
```

**Flag:4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e**

---

## Level 14 to 15

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

**Flag:BfMYroe26WYalil77FoDi9qh59eK5xNr**

---

## Level 15 to 16

The password for the next level can be retrieved by submitting the password of the current level to **port 30001 on localhost** using SSL encryption.

**Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? Use -ign_eof and read the “CONNECTED COMMANDS” section in the manpage. Next to ‘R’ and ‘Q’, the ‘B’ command also works in this version of that command…**

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[Secure Socket Layer/Transport Layer Security on Wikipedia](https://en.wikipedia.org/wiki/Secure_Socket_Layer)
[OpenSSL Cookbook - Testing with OpenSSL](https://www.feistyduck.com/library/openssl-cookbook/online/ch-testing-with-openssl.html)

### Approach

I used the `openssl s_client -connect` cmd to connect to the host over port 30001.

```console
bandit15@bandit:~$ openssl s_client -connect localhost:30001
...
BfMYroe26WYalil77FoDi9qh59eK5xNr # you will need to input previous password
Correct!
cluFn7wTiGryunymYOu4RcffSxQluehd
```

**Flag:cluFn7wTiGryunymYOu4RcffSxQluehd**

---

## Level 16 to 17

The credentials for the next level can be retrieved by submitting the password of the current level to **a port on localhost in the range 31000 to 32000**. First find out which of these ports have a server listening on them. Then find out which of those speak SSL and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[Port scanner on Wikipedia](https://en.wikipedia.org/wiki/Port_scanner)

### Approach

I noted port scanning in the helpful reading section and decided to run a `Nmap` scan on localhost.

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

I then used the same `openssl` cmd like before to connect to each one of those ports and found port 31790 to be the correct one

```console
bandit16@bandit:~$ openssl s_client -connect localhost:31790
...
---
cluFn7wTiGryunymYOu4RcffSxQluehd # entered previous password and recieved an RSA private key
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

I saved the key to a file in a new folder in the tmp directory. Then I used `chmod 600` to set permissions only to myself. Afterwards, I used `ssh` to gain access to the next level.

```console
bandit16@bandit:/tmp/kyle$ chmod 600 bandit17
bandit16@bandit:/tmp/kyle$ ssh -i bandit17 bandit17@localhost
```

---

## Level 17 to 18

There are 2 files in the homedirectory: **passwords.old and passwords.new**. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new

**NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19**

**Commands you may need to solve this level**
cat, grep, ls, diff

### Approach

I used the `diff` cmd to find differences between the old and new password file. since the password for the next level is in password.new, the top line was the flag.

```console
bandit17@bandit:~$ diff passwords.new passwords.old
42c42
< kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
---
> w0Yfolrc5bwjS4qw5mq1nnQi6mF03bii
```

**Flag:kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd**

---

## Level 18 to 19

The password for the next level is stored in a file **readme** in the homedirectory. Unfortunately, someone has modified *.bashrc* to log you out when you log in with ssh.

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

**Flag:IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x**

---

## Level 19 to 20

To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

**Helpful Reading Material**
[setuid on Wikipedia](https://en.wikipedia.org/wiki/Setuid)

### Approach

After some digging, I realized that using the `./bandit20-do` with a cmd executes that cmd as a bandit20 user not bandit19. So I was able to access the bandit20 password file as a bandit20 user.

```console
bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
```

**Flag:GbKksEFF4yrVs6il55v6gwY5aVje5f0j**

---

## Level 20 to 21

There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

**NOTE: Try connecting to your own network daemon to see if it works as you think**

**Commands you may need to solve this level**
ssh, nc, cat, bash, screen, tmux, Unix ‘job control’ (bg, fg, jobs, &, CTRL-Z, …)

### Approach

I opened a second terminal and used `ssh` to access bandit20. Once inside I ran `nc -lv -p 8080` to create a local connection on port 8080 to listen to in verbose mode. On my main terminal I connected to the connection on port 8080 I just made by doing `./suconnect 8080`. On terminal 2 I pasted bandit20s password and received bandit 21s password on my main terminal.

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

**Flag: gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr**

---

## Level 21 to 22

A program is running automatically at regular intervals from **cron, the time-based job scheduler**. Look in */etc/cron.d/* for the configuration and see what command is being executed.

**NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Based on the hint I went to the */etc/cton.d* folder and then looked into *cronjob_bandit22*. Inside I noticed something referring to reboot and a second line with multiple * (in cron this indicates the minutes, hours, etc. before a specific file is executed).

I opened that file using the `cat` cmd and found a second file path in which I had read and write privileges. I took the */etc/bandit_pass/bandit22* file content which I couldn't access and redirected the output to the tmp file which I could.

```console
bandit21@bandit:~$ cd /etc/cron.d
bandit21@bandit:/etc/cron.d$ ls
cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24
cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
bandit21@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit22.sh
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
bandit21@bandit:/etc/cron.d$ cat  /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI
```

**Flag: Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI**

---

## Level 22 to 23

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in */etc/cron.d/* for the configuration and see what command is being executed.

**NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

I took the exact same approach as the previous level. However, I found a bash script containing the following.

```bash
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

Analyzing the script, I noticed that by running line 4 (the mytarget line) and swapping *$myname* with bandit23 gives me a hash that I then used to read the file containing the flag.

```console
bandit22@bandit:/etc/cron.d$ echo I am user bandit23 | md5sum | cut -d ' ' -f 1
8ca319486bfbbc3663ea0fbe81326349
bandit22@bandit:/etc/cron.d$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
```

**Flag: jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n**

---

## Level 23 to 24

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in */etc/cron.d/* for the configuration and see what command is being executed.

**NOTE: This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level!**

**NOTE 2: Keep in mind that your shell script is removed once executed, so you may want to keep a copy around…**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

So the script I found this time does the following:

1. Finds out who the current user is.
2. Goes to the /var/spool/ directory of the user.
3. And for each filename of any extension that is not the parent or child directory executes some stuff and then removes the file.

```bash
#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname
echo "Executing and deleting all scripts in /var/spool/$myname:" 
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done
```

I created this bash script in a tmp folder. (similar to one from a previous level)

```bash
myname=bandit24
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
cat /tmp/$mytarget
```

Instead of running the script with the current user I ran it as if I was bandit24 to get the flag.

```console
bandit23@bandit:/tmp/kyle$ ./script.sh
Copying passwordfile /etc/bandit_pass/bandit24 to /tmp/ee4ee1703b083edac9f8183e4ae70293
./script.sh: line 8: /tmp/ee4ee1703b083edac9f8183e4ae70293: Permission denied
UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
```

**Side Note**
I looked at other sources for how they got the flag and noticed that information in the *cronjob_bandit24.sh* script can be used to execute a cmd. I used the cmd shown below and updating privileges using `chmod 777 [script filename]`.

```bash
#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/[temp dict name]/password.txt
```

Since the original cronjob executes minute by minute, if the script is executed, and you wait a minute the *password.txt* file will show up in the tmp folder, if you cat into that file from the var/spool directory you will get the flag.

**Flag: UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ**

---

## Level 24 to 25

A daemon is listening on **port 30002** and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pin code. There is no way to retrieve the pin code except by going through all 10000 combinations, called brute-forcing.

### Approach

I went ahead and created a new script that looped through a 4-digit combination from 0000 to 9999 and each time it would echo the password from the previous file and that iterations combo to the screen.

```bash
#!/bin/bash

password="UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ"

for i in {0000..9999}
do
    echo $password $i
done
```

I then output the results to a text file, and then I connected to the localhost `nc localhost 30002` and redirected the output from the text file to the request from the connection.

```console
bandit24@bandit:nc localhost 30002 < output.txt
...
Correct!
The password of user bandit25 is uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG
```

**Flag: uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG**

---

## Level 25 to 26

Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is **not /bin/bash**, but something else. Find out what it is, how it works and how to break out of it.

**Commands you may need to solve this level**
ssh, cat, more, vi, ls, id, pwd

### Approach

In the home directory I found an sshkey that I used to connect to bandit26 with the `ssh -i bandit26.sshkey bandit26@localhost` cmd. I noticed the connection closes instantly with no shell. I checked out the */etc/passwd* file to see file store information. Then I noticed bandit26 isn't using */bin/bash* but rather */usr/bin/showtext*.

Using the `more` cmd and a tiny or zoomed in terminal (in order to get `more` to show properly) I was able to execute cmds using `!`. I could also open editors using the `v` cmd, which I did. Once inside the vim editor I did `:r /etc/bandit_pass/bandit26` and got the flag.

**Flag:  5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z**

---

## Level 26 to 27

Good job getting a shell! Now hurry and grab the password for bandit27!

**Commands you may need to solve this level**
ls

### Approach

Similar approach to the previous level, however now that your in the editor you want to run a few commands in order to find the flag.

I first set the shell to /bin/bash in order to run cmds. Then using `ls -la` I could so all the files and noticed a *bandit27-do* (similar to the ./sunconnect file form a previous level). Assuming this gives me bandit27 rights I used it to access the bandit_pass/bandit27 file for the flag.

```console
:set shell=/bin/bash
:shell
[No write since last change]
bandit26@bandit:~$ ls -la
total 36
drwxr-xr-x  3 root     root     4096 May  7  2020 .
drwxr-xr-x 41 root     root     4096 May  7  2020 ..
-rwsr-x---  1 bandit27 bandit26 7296 May  7  2020 bandit27-do
-rw-r--r--  1 root     root      220 May 15  2017 .bash_logout
-rw-r--r--  1 root     root     3526 May 15  2017 .bashrc
-rw-r--r--  1 root     root      675 May 15  2017 .profile
drwxr-xr-x  2 root     root     4096 May  7  2020 .ssh
-rw-r-----  1 bandit26 bandit26  258 May  7  2020 text.txt
bandit26@bandit:~$ ./bandit27-do cat /etc/bandit_pass/bandit27
3ba3118a22e93127a4ed485be72ef5ea
```

**Flag: 3ba3118a22e93127a4ed485be72ef5ea**

---

# Level 27 to 28

There is a git repository at **ssh://bandit27-git@localhost/home/bandit27-git/repo**. The password for the user bandit27-git is the same as for the user bandit27.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Using the `git clone` cmd I was able to download the repo and access it. I first made a tmp directory and `cd` into it. Once inside i run `bandit27@bandit:/tmp/kyle2$ git clone ssh://bandit27-git@localhost/home/bandit27-git/repo`.

```console
bandit27@bandit:/tmp/kyle2$ ls -la repo
total 16
drwxr-sr-x 3 bandit27 root 4096 Aug 17 00:19 .
drwxr-sr-x 3 bandit27 root 4096 Aug 17 00:19 ..
drwxr-sr-x 8 bandit27 root 4096 Aug 17 00:19 .git
-rw-r--r-- 1 bandit27 root   68 Aug 17 00:19 README
bandit27@bandit:/tmp/kyle2$ cd repo
bandit27@bandit:/tmp/kyle2/repo$ cat README
The password to the next level is: 0ef186ac70e04ea33b4c1853d2526fa2
```

**Flag: 0ef186ac70e04ea33b4c1853d2526fa2**

---

# Level 27 to 28

**Level Goal**
There is a git repository at **ssh://bandit28-git@localhost/home/bandit28-git/repo**. The password for the user bandit28-git is the same as for the user bandit28.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Same starting approach as before, but this time the password was not visible. I ran `git log` to see changes to the repo and then used `git show` with the commit hash to go back to a previous commit to uncover the password.

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

**Flag: bbc96594b4e001778eee9975372716b2**

---

## Level 29 → 30

There is a git repository at **ssh://bandit29-git@localhost/home/bandit29-git/repo**. The password for the user bandit29-git is the same as for the user bandit29.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Similar starting approach to the previous level. However, this time I had to access a different branch to look at commits and find changes that showed the password.

I checked for other branches using `git branch -a`. I then checked out a different branch using `git checkout remotes/origin/dev`. I ran `git log` and noticed data was added for development. Ran `git show` on that commit hash and got the flag.

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

**Flag: 5b90576bedb2cc04c86a9e924ce42faf**

---

## Level 30 to 31

There is a git repository at **ssh://bandit30-git@localhost/home/bandit30-git/repo**. The password for the user bandit30-git is the same as for the user bandit30.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Similar starting approaches as before. When those failed I went into the .git directory (using `ls -la` to find) and checked out the packer-ref file, I noticed a different commit hash, tried it out and found the flag.

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
bandit30@bandit:/tmp/kyle12/repo/.git$ cat packed-refs 
# pack-refs with: peeled fully-peeled 
3aefa229469b7ba1cc08203e5d8fa299354c496b refs/remotes/origin/master
f17132340e8ee6c159e0a4a6bc6f80e1da3b1aea refs/tags/secret
bandit30@bandit:/tmp/kyle12/repo/.git$ git show f17132340e8ee6c159e0a4a6bc6f80e1da3b1aea
47e603bb428404d265f59c42920d81e5
```

**Flag:47e603bb428404d265f59c42920d81e5**

---

## Level 31 to 32

There is a git repository at **ssh://bandit31-git@localhost/home/bandit31-git/repo**. The password for the user bandit31-git is the same as for the user bandit31.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Similar approaches as before. This time I needed to create a *key.txt* file and then add it, commit it, and then push it using git. After I pushed it I put in the previous levels password and got the flag.

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

**Flag: 56a9bf19c63d650ce78e6ec0354ee45e**

---

## Level 32 to 33

After all this git stuff it's time for another escape. Good luck!

**Commands you may need to solve this level**
sh, man

### Approach

I was able to get an interactive shell by inserting $0, then ran vim to read the password for the next level.

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

**Flag: c9c3199ddf4121b10cf581a98d51caee**

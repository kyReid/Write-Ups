# Wargame: Bandit

## Level 0

The password for the next level is stored in a file called **readme** located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

**Commands you may need to solve this level**

ls, cd, cat, file, du, find

### Approach

1. Use the man page on ssh and discovered how to use ssh to login.

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```
Then login with the password: bandit0

2. After gaining access, run the following commands to see what is available. Then use the cat command to read the readme file in the terminal to get the flag inside.

```bash
bandit0@bandit:~$ ls # shows all files in current directory
readme
bandit0@bandit:~$ cat readme # cat allows me to read a file in terminal
boJ9jbbUNNfktd78OOpsqOltutMc3MY1
```

## Level 1

The password for the next level is stored in a file called **-** located in the home directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

**Helpful Reading Material**
[Google Search for “dashed filename”](https://www.google.com/search?q=dashed+filename)
[Advanced Bash-scripting Guide - Chapter 3 - Special Characters](http://tldp.org/LDP/abs/html/special-chars.html)

### Approach

1. logged in using next bandit level with the password being the flag found from the previous challenge. **password: boJ9jbbUNNfktd78OOpsqOltutMc3MY1**

```bash
bandit1@bandit.labs.overthewire.org -p 2220
```
2. Tried different ideas to figure out where the file was and how to access it. Not sure the reason yet but brute forcing my way through i was able to find the right command to show the flag.

```bash
bandit1@bandit:~$ ls # To see what files/dictionaries i can see
-
bandit1@bandit:~$ cat ./-
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```

**After doing additional research:**
Using `-` as a filename to mean stdin/stdout is a convention that a lot of programs use. It is not a special property of the filename. The kernel does not recognize `-` as special so any system calls referring to `-` as a filename will use `-` literally as the filename.

With bash redirection, - is not recognized as a special filename, so bash will use that as the literal filename.

When cat sees the string `-` as a filename, it treats it as a synonym for stdin. To get around this, you need to alter the string that cat sees in such a way that it still refers to a file called `-.` The usual way of doing this is to prefix the filename with a path `./-,` or `/home/Tim/-.` This technique is also used to get around similar issues where command line options clash with filenames, so a file referred to as `./-e` does not appear as the `-e` command line option to a program.Both **cat < -** and **./-** command will give you the output

## Level 2


The password for the next level is stored in a file called spaces in this filename located in the home directory

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

**Helpful Reading Material**
[Google Search for “spaces in filename”](https://www.google.com/search?q=spaces+in+filename)

### Approach

Ran typical directory reconnaissance to see what files were available. This file included spaces. I knew quotes join filenames with spaces.

```bash
bandit2@bandit:~$ ls # check to directory for files
spaces in this filename
bandit2@bandit:~$ file spaces\ in\ this\ filename # ran the file command to see what kind of file this was
spaces in this filename: ASCII text
bandit2@bandit:~$ cat 'spaces in this filename' # used quotes to wrap the filename so it joined the spaces together to ready the file.
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
```

## Level 3


The password for the next level is stored in a **hidden file** in the **inhere** directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Ran typical directory reconnaissance, since the file was hidden i used the `ls -a` command to show all files including hidden ones, then used the `cat` command to read it.

```bash
bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cd inhere
bandit3@bandit:~/inhere$ ls -a # the -a allows you to see all objects even those hidden behind with .
.  ..  .hidden
bandit3@bandit:~/inhere$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```

## Level 4

The password for the next level is stored in the **only human-readable file in the inhere directory**. Tip: if your terminal is messed up, try the “reset” command.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Ran some reconnaissance on the directories, tried using `ls -h` since it mentioned something about human readability. Did nothing, so i tried using the `file ./filename` to get information on the file, output told me which files were just data and which one was readable.

```bash
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

## Level 5

The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Based on the information provided above, i figured i had to run some sort of search using the `find` and `file` command.Running through the `find` man page i was able to find options to find the file based on the properties mentioned above.

```bash
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

## Level 6

The password for the next level is stored somewhere on the server and has all of the following properties:

owned by user bandit7
owned by group bandit6
33 bytes in size

**Commands you may need to solve this level**
ls, cd, cat, file, du, find, grep

### Approach

Used a similar approach to level 5, man paged the `find ` command to find options for finding files by user and groups. Had to `cd ..` twice to access the entire server. Once there, i did the following.

```bash
bandit6@bandit:/$ find -size 33c -group bandit6 -user bandit7
./var/lib/dpkg/info/bandit7.password                <--------------- location of file
bandit6@bandit:/$ cd var/lib/dpkg/info/ # went to that files directory
bandit6@bandit:/var/lib/dpkg/info$ find -size 33c -group bandit6 -user bandit7 # ran a search to confirm location
./bandit7.password
bandit6@bandit:/var/lib/dpkg/info$ cat ./bandit7.password # opened file to get flag, Booyah!
HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

```

## Level 7

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

```bash
bandit7@bandit:~$ grep -e millionth data.txt # -e is the pattern to search for a pattern in the given file
millionth       cvX2JJa4CFALtqS87jk27qwqGhBM9plV 
```

## Level 8

The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Piping and Redirection](https://ryanstutorials.net/linuxtutorial/piping.php)

### Approach


After diving into the sort and uniq commands i was able to find `sort` and `uniq -c`. The `uniq -c` command counts up all the lines in a file and gave a count for the number of occurrences found.

```bash
sort data.txt | uniq -c # the | (pipe) command allows me to take the output from one command and immediately insert it into another command
```

command will output several lines that have multiple occurrences but one that is unique as well.
**UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR**

## Level 9

The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

### Approach


A similar approach to level 8 using `sort`, `grep`, and potentially `strings`.

I figured i'd try and just run `strings data.txt` to see what strings were actually in the file that i could read. I noted an array of strings after several = characters. I tried that and it worked.

**truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk**

```
x@nQ
*SF=s
}1:LF
]vur
Emlld
&========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk # FLAG
_Gmz
\Uli,
A5RK
S'$0
<4t",
```

## Level 10

The password for the next level is stored in the file data.txt, which contains base64 encoded data

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)

### Approach


Since the data.txt file was encoded with base64, I used the `base64 data.txt -d` command to decode the text file and ready the flag.

```bash
bandit10@bandit:~$ base64 data.txt -d
The password is IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
```

## Level 11

The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Rot13 on Wikipedia](https://en.wikipedia.org/wiki/Rot13)

### Approach

1. download hxtools in a seperate terminal to use rot13 cmd

```bash
bandit11@bandit:~$ ls
data.txt
bandit11@bandit:~$ cat data.txt
Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh

echo "Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh" | rot13
The password is 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
```

## Level 12

**Level Goal**
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file

**Helpful Reading Material**
[Hex dump on Wikipedia](https://en.wikipedia.org/wiki/Hex_dump)

### Approach

```bash
mkdir /tmp/filename
cp data.txt /tmp/filename
cd /tmp/filename

bandit12@bandit:/tmp/k123$ man xxd
bandit12@bandit:/tmp/k123$ xxd -r data.txt > flag.txt
bandit12@bandit:/tmp/k123$ file flag.txt
flag.txt: gzip compressed data, was "data2.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
```
Use the following sequence to go through and uncompress files using gunzip, bunzip2, and tar -xvf until you get and ACSII file again containing the password.

```bash
andit12@bandit:/tmp/k123$ file data8.bin
data8.bin: gzip compressed data, was "data9.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
bandit12@bandit:/tmp/k123$ mv data8.bin data8.gz
bandit12@bandit:/tmp/k123$ gunzip data8.gz
bandit12@bandit:/tmp/k123$ file data8
data8: ASCII text
bandit12@bandit:/tmp/k123$ cat data8
The password is 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
```

## Level 13

**Level Goal**
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on

**Commands you may need to solve this level**
ssh, telnet, nc, openssl, s_client, nmap

**Helpful Reading Material**
[SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

### Approach

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
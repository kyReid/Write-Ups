# Level 1

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
bandit1@bandit:~$ cat - # tried opening the - file
^C
bandit1@bandit:~$ ./- #tried running the file thinking it was a script or something
-bash: ./-: Permission denied
bandit1@bandit:~$ cat ./- # tried opening after executing, it worked! (no idea why)
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```

**After doing additional research:**
Using `-` as a filename to mean stdin/stdout is a convention that a lot of programs use. It is not a special property of the filename. The kernel does not recognize `-` as special so any system calls referring to `-` as a filename will use `-` literally as the filename.

With bash redirection, - is not recognized as a special filename, so bash will use that as the literal filename.

When cat sees the string `-` as a filename, it treats it as a synonym for stdin. To get around this, you need to alter the string that cat sees in such a way that it still refers to a file called `-.` The usual way of doing this is to prefix the filename with a path `./-,` or `/home/Tim/-.` This technique is also used to get around similar issues where command line options clash with filenames, so a file referred to as `./-e` does not appear as the `-e` command line option to a program.Both **cat < -** and **./-** command will give you the output

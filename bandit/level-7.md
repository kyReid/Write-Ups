# Level 7

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

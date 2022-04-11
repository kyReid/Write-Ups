# Level 8

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

# Level -2


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

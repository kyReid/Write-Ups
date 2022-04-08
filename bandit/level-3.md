# Level 3


The password for the next level is stored in a **hidden file** in the **inhere** directory.

**Commands you may need to solve this level**
ls, cd, cat, file, du, find

### Approach

Ran typical directory reconnaissance, since the file was hidden i used the `ls -a` command to show all files including hidden ones, then used the `cat` command to read it.

```bash
bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cd inhere
bandit3@bandit:~/inhere$ ls -a # the -a allows me to see all objects even those hidden behind with .
.  ..  .hidden
bandit3@bandit:~/inhere$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```



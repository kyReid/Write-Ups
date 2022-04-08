# Level 5

The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable

**Commands you may need to solve this level**
ls, cd, cat, file, du, find


### Approach

Based on the information provided above, i figured i had to run some sort of search using the `find` and `file` command.

Running through the `find` man page i was able to find options to find the file based on the properties mentioned above.

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

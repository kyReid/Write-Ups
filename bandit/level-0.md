# Level 0

The password for the next level is stored in a file called **readme** located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

**Commands you may need to solve this level**

ls, cd, cat, file, du, find

### Approach

1. Ran the man page on ssh and discovered how to use ssh to login.

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```
Then login with the password: bandit0

2. After gaining access, i ran the following commands to see what was available to me. then used the cat command to read the readme file in the terminal to get the flag inside.

```bash
bandit0@bandit:~$ ls # shows all files in current directory
readme
bandit0@bandit:~$ cat readme # cat allows me to read a file in terminal
boJ9jbbUNNfktd78OOpsqOltutMc3MY1
```

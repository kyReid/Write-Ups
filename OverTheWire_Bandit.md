Flag: boJ9jbbUNNfktd78OOpsqOltutMc3MY1

Flag: CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

Flag:UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
Flag:pIwrPrtPN36QITSp3EQaw936yaFoFgAB

Flag:koReBOKuIDDepwhWk7jZC0RTdopnAYKh

Flag: DXjZPULLxYr17uwoI01bNLQbtFemEgo7

Flag: HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

Flag:cvX2JJa4CFALtqS87jk27qwqGhBM9plV


FLag:UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
&========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
Flag:truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

Flag:IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

Flag:5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

Flag:8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

Flag:4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

Flag:BfMYroe26WYalil77FoDi9qh59eK5xNr

Flag:cluFn7wTiGryunymYOu4RcffSxQluehd

Flag:kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd

Flag:IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x

Flag:GbKksEFF4yrVs6il55v6gwY5aVje5f0j


I opened a second terminal and ssh'd into bandit20. Once inside i ran `nc -lv -p 8080` to create a local connection on port 8080 to listen to in verbose mode. On my main terminal i connected to my local connection on port 8080 by doing `./suconnect 8080`. On terminal 2 i pasted bandit20s password and recieved bandit 21s password on my main terminal.

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

Flag: gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr

## Level 21 -> 22

**Level Goal**
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

**NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Based on the hint, i checked out the cron.d folder and ran the `cat` cmd on several files following the trail until i got to the flag.

```console
bandit21@bandit:~$ cd /etc/cron.d
bandit21@bandit:/etc/cron.d$ ls
cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24
cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root
bandit21@bandit:/etc/cron.d$ ls -la
total 36
drwxr-xr-x  2 root root 4096 Jul 11  2020 .
drwxr-xr-x 87 root root 4096 May 14  2020 ..
-rw-r--r--  1 root root   62 May 14  2020 cronjob_bandit15_root
-rw-r--r--  1 root root   62 Jul 11  2020 cronjob_bandit17_root
-rw-r--r--  1 root root  120 May  7  2020 cronjob_bandit22
-rw-r--r--  1 root root  122 May  7  2020 cronjob_bandit23
-rw-r--r--  1 root root  120 May 14  2020 cronjob_bandit24
-rw-r--r--  1 root root   62 May 14  2020 cronjob_bandit25_root
-rw-r--r--  1 root root  102 Oct  7  2017 .placeholder
bandit21@bandit:/etc/cron.d$ cat cronjob_bandit22
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
bandit21@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit22.sh
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
bandit21@bandit:/etc/cron.d$ cat  /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI
```

Flag: Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI

## Level 22 -> 23

**Level Goal**

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

**NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Similar to the previous level i navigated the various dictionaries and folders and opened up the /usr/bin/cronjob_bandit23.sh file inside i found a bash script..
```bash
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```
Analyizing the script, i noticed that by running line 4 (the mytarget line) and swapping $myname with bandit23 gives me a hash that i then used to read the file containing the flag.

```console
bandit22@bandit:~$ cd /etc/cron.d/
bandit22@bandit:/etc/cron.d$ ls
cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24
cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root
bandit22@bandit:/etc/cron.d$ cat cronjob_bandit23
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
bandit22@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit23.sh
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

bandit22@bandit:/etc/cron.d$ echo I am user bandit23 | md5sum | cut -d ' ' -f 1
8ca319486bfbbc3663ea0fbe81326349
bandit22@bandit:/etc/cron.d$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
```
Flag: jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n

## Level 23 -> 24

**Level Goal**

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

**NOTE: This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level!**
**NOTE 2: Keep in mind that your shell script is removed once executed, so you may want to keep a copy around…**

**Commands you may need to solve this level**
cron, crontab, crontab(5) (use “man 5 crontab” to access this)

### Approach

Really have no clue how the script under `bandit23@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit24.sh` :
```bash
#!/bin/bash

myname=$(whoami) # figures out the current owner

cd /var/spool/$myname # goes to this directory in order to execute cmd
echo "Executing and deleting all scripts in /var/spool/$myname:" 
for i in * .*; # for each index that is of any name . any file extension
do
    if [ "$i" != "." -a "$i" != ".." ]; # as long as its not the parent or child directory
    then # do some things with the current file
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i # remove file
    fi
done
```
relates to anything else. I created a bash script in a tmp folder and created the following script...
```bash
myname=bandit24
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
cat /tmp/$mytarget
```
Instead of running the script with the current user i ran it as if i was bandit24. AFter updating the permissions and running the script i got the flag.
```console
bandit23@bandit:/tmp/kyle$ ./script.sh
Copying passwordfile /etc/bandit_pass/bandit24 to /tmp/ee4ee1703b083edac9f8183e4ae70293
./script.sh: line 8: /tmp/ee4ee1703b083edac9f8183e4ae70293: Permission denied
UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
```

Flag: UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ

**Additional Research**
I looked at other sources for how they got the flag and noticed that information in the cronjob_bandit24.sh script can be used to execute a command.Using the following script and updating privileges using `chmod 777 [script filename]`

```bash
#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/[temp dict name]/password.txt
```

Since the original cronjob executes minute by minute, if the script is executed and you wait a minute the password.txt file will show up in the tmp folder, if you cat into that file from the var/spool directory you will get the flag.

## Level 24 -> 25

**Level Goal**

A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.

### Approach

I went ahead and created a new script that did the following
```bash
#!/bin/bash

password="UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ"

for i in {0000..9999}
do
    echo $password $i
done
```
After that i output the results to a txt file and then i connected to the localhost `nc localhost 30002` and redirected the output from the text file to the request from the connection.

```console
bandit24@bandit:nc lkocalhost 30002 < output.txt
...
Correct!
The password of user bandit25 is uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG
```

Flag: uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG

## Level 25 -> 26

**Level Goal**
Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is not /bin/bash, but something else. Find out what it is, how it works and how to break out of it.

**Commands you may need to solve this level**
ssh, cat, more, vi, ls, id, pwd

### Approach

in the home directory i found an sshkey that i used to try to connect to bandit26  `ssh -i bandit26.sshkey bandit26@localhost`. Connection closes out instantly with no shell. I check out the `/etc/passwd` file to see file store information. I noticed bandit26 isn't `/bin/bash` but `/usr/bin/showtext`.  I ran the file cmd to see whta it was and then i ran the cat cmd to see what type of script it was. Using the more cmd i can execute commands on the connection page to show more(I have to zoom in really close on the terminal to have the ability to execute on the more cmd). On the more man page is talks about using the v cmd to enter edit mode, once inside the vim editor i dod `:r /etc/bandit_pass/bandit26` and got the flag.

Flag:  5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z 

Level 26 → Level 27

**Level Goal**
Good job getting a shell! Now hurry and grab the password for bandit27!

**Commands you may need to solve this level**
ls

### Approach

Similar approach to the previous level, however now that your in the editor you want to run a few commands in order to find the flag.
```console
:set shell=/bin/bash #change the type of shell used
:!ls -la #list the files in the directory
total 36
drwxr-xr-x  3 root     root     4096 Oct 16 14:00 .
drwxr-xr-x 41 root     root     4096 Oct 16 14:00 ..
-rwsr-x---  1 bandit27 bandit26 7296 Oct 16 14:00 bandit27-do
-rw-r--r--  1 root     root      220 May 15  2017 .bash_logout
-rw-r--r--  1 root     root     3526 May 15  2017 .bashrc
-rw-r--r--  1 root     root      675 May 15  2017 .profile
drwxr-xr-x  2 root     root     4096 Oct 16 14:00 .ssh
-rw-r-----  1 bandit26 bandit26  258 Oct 16 14:00 text.txt
:!./bandit27-do cat /etc/bandit_pass/bandit27 #bandit27-do is similar to sunconnect from a previous level where it can be used to access the information restricted to a user.                                                                   
3ba3118a22e93127a4ed485be72ef5ea
```

Flag: 3ba3118a22e93127a4ed485be72ef5ea

# Level 27 -> 28

**Level Goal**
There is a git repository at ssh://bandit27-git@localhost/home/bandit27-git/repo. The password for the user bandit27-git is the same as for the user bandit27.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

using the git clone cmd i'm able to download the repo and access it. I first make a tmp directory and cd into it. Once inside i run `bandit27@bandit:/tmp/kyle2$ git clone ssh://bandit27-git@localhost/home/bandit27-git/repo`.

```console
bandit27@bandit:/tmp/kyle2$ ls
repo
bandit27@bandit:/tmp/kyle2$ ls -la repo
total 16
drwxr-sr-x 3 bandit27 root 4096 Aug 17 00:19 .
drwxr-sr-x 3 bandit27 root 4096 Aug 17 00:19 ..
drwxr-sr-x 8 bandit27 root 4096 Aug 17 00:19 .git
-rw-r--r-- 1 bandit27 root   68 Aug 17 00:19 README
bandit27@bandit:/tmp/kyle2$ cd repo
bandit27@bandit:/tmp/kyle2/repo$ ls
README
bandit27@bandit:/tmp/kyle2/repo$ cat README
The password to the next level is: 0ef186ac70e04ea33b4c1853d2526fa2
```

Flag: 0ef186ac70e04ea33b4c1853d2526fa2

# Level 27 -> 28

**Level Goal**
There is a git repository at ssh://bandit28-git@localhost/home/bandit28-git/repo. The password for the user bandit28-git is the same as for the user bandit28.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

CLone the repo to a tmp work space then check the readme file, noticed the password was not visible. ran git log to see changes to the repo and then used git show with the commit hash to go back to a previous commit to uncover the password.

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

Flag: bbc96594b4e001778eee9975372716b2

Level 29 → Level 30
**Level Goal**
There is a git repository at ssh://bandit29-git@localhost/home/bandit29-git/repo. The password for the user bandit29-git is the same as for the user bandit29.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

This involves working through branches. Notice that the current master branch doesn't have anything for us so we check for other branches using `git branch -a` I then checked out a different branch using `git checkout remotes/origin/dev`. I ran gitt log and noticed data was added for development. Ran `git show` on that commit hash and got the flag.

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

Flag: 5b90576bedb2cc04c86a9e924ce42faf

Level 30 → Level 31

**Level Goal**
There is a git repository at ssh://bandit30-git@localhost/home/bandit30-git/repo. The password for the user bandit30-git is the same as for the user bandit30.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

Tried all the various methods prior and nothing changed. went into the .git directory and checked out the packer-ref file, noticed a different commit hash, tried it out and found the flag.

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
bandit30@bandit:/tmp/kyle12/repo/.git$ cat config
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = ssh://bandit30-git@localhost/home/bandit30-git/repo
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
bandit30@bandit:/tmp/kyle12/repo/.git$ cat packed-refs 
# pack-refs with: peeled fully-peeled 
3aefa229469b7ba1cc08203e5d8fa299354c496b refs/remotes/origin/master
f17132340e8ee6c159e0a4a6bc6f80e1da3b1aea refs/tags/secret
bandit30@bandit:/tmp/kyle12/repo/.git$ git show f17132340e8ee6c159e0a4a6bc6f80e1da3b1aea
47e603bb428404d265f59c42920d81e5
```

Flag:47e603bb428404d265f59c42920d81e5

Level 31 → Level 32
**Level Goal**
There is a git repository at ssh://bandit31-git@localhost/home/bandit31-git/repo. The password for the user bandit31-git is the same as for the user bandit31.

Clone the repository and find the password for the next level.

**Commands you may need to solve this level**
git

### Approach

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

Flag: 56a9bf19c63d650ce78e6ec0354ee45e

Level 32 → Level 33

After all this git stuff its time for another escape. Good luck!

**Commands you may need to solve this level**
sh, man

### Approach

get an interactive shell by inserting $0 in the fake shell, then we run vim end read the password for the next level.

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

Flag: c9c3199ddf4121b10cf581a98d51caee
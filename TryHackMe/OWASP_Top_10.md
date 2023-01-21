# OWASP Top 10 Module

## Command Injection Practial


What strange text file is in the website root directory? **drpepper.txt**

> **Explain:** Using the `ls -a` command you will get a list of all files in current directory (you can check path of current directory by using `pwd` command)

How many non-root/non-service/non-daemon users are there? **0**

> **Explain:** run the `ping -c 1 10.x.x.x; ps -ef` command

What user is this app running as? **www-data**

> **Explain:** run the `whoami` command

What is the user's shell set as? **/usr/sbin/nlogin**

> **Explain:** this information can be located in the /etc/passwd file using the command `cat /etc/passwd | grep www-data`

What version of Ubuntu is running? **18.04.4**

> **Explain:** run the command `lsb_release -a`

Print out the MOTD (message of the day.  What favorite beverage is shown?

> **Explain:** The /etc/motd is a file on Unix-like systems that contains a “message of the day”, used to send a common message to all users in a more efficient manner than sending them all an e-mail message. To locate a specific MOTD file and to read its content we run the command `cat /etc/update-motd.d/00-header` command. The 00-header you will get from the hint of the question.

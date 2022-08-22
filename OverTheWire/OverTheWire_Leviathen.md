# OverTheWire: Leviathan

Difficulty:     1/10
Levels:         8
Platform:   Linux/x86

**Description:** This wargame doesn't require any knowledge about programming - just a bit of common sense and some knowledge about basic *nix commands. We had no idea that it'd be this hard to make an interesting wargame that wouldn't require programming abilities from the players. Hopefully we made an interesting challenge for the new ones. Leviathan’s levels are called leviathan0, leviathan1, … etc. and can be accessed on leviathan.labs.overthewire.org through SSH on port 2223.

---

## Level 0 to 1

There is no information for this level, intentionally.

### Approach

I ran `ls -a` and noticed a *.backup* folder. I `cd` into it and ran `ls -a` again and noticed an HTML file. Opening the file I noticed massive lines of text. I ran `grep -e password` on the file to check for any lines containing a password and I found it :)

```console
leviathan0@leviathan:~$ ls -a
.  ..  .backup  .bash_logout  .bashrc  .profile
leviathan0@leviathan:~$ cd .backup/
leviathan0@leviathan:~/.backup$ ls -a
.  ..  bookmarks.html
leviathan0@leviathan:~/.backup$ grep -e password bookmarks.html
<DT><A HREF="http://leviathan.labs.overthewire.org/passwordus.html | This will be fixed later, the password for leviathan1 is rioGegei8m" ADD_DATE="1155384634" LAST_CHARSET="ISO-8859-1" ID="rdf:#$2wIU71">password to leviathan1</A>
```

Flag: rioGegei8m

---

## Level 1 to 2

There is no information for this level, intentionally.

### Approach


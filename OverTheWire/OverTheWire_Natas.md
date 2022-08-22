# Natas

Natas teaches the basics of server side web-security.

Each level of natas consists of its own website located at <http://natasX.natas.labs.overthewire.org>, where X is the level number. There is no SSH login. To access a level, enter the username for that level (e.g. natas0 for level 0) and its password.

Each level has access to the password of the next level. Your job is to somehow obtain that next password and level up. All passwords are also stored in /etc/natas_webpass/. E.g. the password for natas5 is stored in the file /etc/natas_webpass/natas5 and only readable by natas4 and natas5.

---

## level 0

**Username**: natas0
**Password**: natas0
**URL**:      <http://natas0.natas.labs.overthewire.org>

### Approach

I logged into the Natas0 website and my first thought was to inspect the page. Under the inspector I expanded the `<div id="content">` section and got the flag.

![Hint](/OverTheWire/natas-screenshots/natas0-hint.PNG)
![flag found](/OverTheWire/natas-screenshots/natas0_flag.PNG)

**Flag: gtVrDuiDfck831PqWsLEZy5gyDz1clto**

---

## Level 0 to 1

Username: natas1
URL:      <http://natas1.natas.labs.overthewire.org>

### Approach

The webpage says you can't right-click, however right-clicking is only blocked in the white text field, the gray space around the text is still unlocked. I then inspected the page and found the flag under `<div id="content">`.

![Hint](/OverTheWire/natas-screenshots/natas0-1_hint.PNG)
![flag found](/OverTheWire/natas-screenshots/natas0-1_inspection.PNG)

**Flag: ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi**

---

## Level 1 to 2

Username: natas2
URL:      <http://natas2.natas.labs.overthewire.org>

### Approach

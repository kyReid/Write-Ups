# Level 10

The password for the next level is stored in the file data.txt, which contains base64 encoded data

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

**Helpful Reading Material**
[Base64 on Wikipedia](https://en.wikipedia.org/wiki/Base64)

### Approach


Since the data.txt file was encoded with base64, I used the `base64 data.txt -d` command to decode the text file and ready the flag.

```bash
bandit10@bandit:~$ base64 data.txt -d
The password is IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
```
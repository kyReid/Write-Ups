# Level 9

The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

**Commands you may need to solve this level**
grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

### Approach


A similar approach to level 8 using `sort`, `grep`, and potentially `strings`.

I figured i'd try and just run `strings data.txt` to see what strings were actually in the file that i could read. I noted an array of strings after several = characters. I tried that and it worked.

**truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk**

```
x@nQ
*SF=s
}1:LF
]vur
Emlld
&========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk # this is the string i noticed and tried
_Gmz
\Uli,
A5RK
S'$0
<4t",
```
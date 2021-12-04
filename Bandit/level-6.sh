"
The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable
"

# find files of size 1033 bytes 
# is human readable
# not executable
find -size 1033c -readable ! -executable

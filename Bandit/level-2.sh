"This type of approach has a lot of misunderstanding because 
using - as an argument refers to STDIN/STDOUT i.e dev/stdin
or dev/stdout .So if you want to open this type of file you
have to specify the full location of the file such as ./- 
.For eg. , if you want to see what is in that file use cat ./-"

# to open "-" files use
cat ./-

#  or you can use
cat < -
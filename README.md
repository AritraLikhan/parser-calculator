Install MinGW, Flex and Bison and RUN following commands on terminal:
```
bison -d calc.y -o y.tab.c
```
```
flex calc2.l
```
``` 
gcc -o calc y.tab.c lex.yy.c
```
```
.\calc
```


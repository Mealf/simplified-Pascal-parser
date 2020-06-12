# simplified-Pascal-parser
```
flex lex.l
bison -vdty yacc.y
gcc -o parser y.tab.c lex.yy.c -LL
./parser < prog1
```
prog1 : 正確的, prog2~prog4都有錯誤

prog2 : 變數SUM改成1SUM

prog3 : SUM := 0 後面少一個分號

prog4 : DIV 寫成 /

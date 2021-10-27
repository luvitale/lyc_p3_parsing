LEX=flex
BISON=bison
CC=gcc

1.app: lex.yy.c y.tab.c
	$(CC) lex.yy.c y.tab.c -o 1.app

1.yy.c: 1.l
	$(LEX) 1.l -o 1.yy.c

1.tab.c: 1.y
	$(BISON) -dyv 1.y -o 1.tab.c

clean:
	rm -f *.yy.* *.app *.tab.* *.output

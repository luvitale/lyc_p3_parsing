LEX=flex
BISON=bison
CC=gcc
OBJECT_1_NAME=1.app

all: 1.app

1.app: 1.yy.c 1.tab.c
	$(CC) -o $(OBJECT_1_NAME) 1.yy.c 1.tab.c -fcommon

1.yy.c: 1.l
	$(LEX) -o 1.yy.c 1.l

1.tab.c: 1.y
	$(BISON) -o 1.tab.c -dyv 1.y

test1: 1.app
	./$(OBJECT_1_NAME) ./test/1/code.txt

test: test1

clean:
	rm -f *.yy.* *.app *.tab.* *.output

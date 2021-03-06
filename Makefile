CC=gcc

ifeq ($(OS),Windows_NT)
	LEX=win_flex
	BISON=win_bison
	EXT=exe
else
	LEX=flex
	BISON=bison
	EXT=app
endif

all: 1.app 2.app 3.app

%.app: %.yy.c %.tab.c
	$(CC) -o $*.$(EXT) $? -fcommon

%.yy.c: %.l
	$(LEX) -o $@ $<

%.tab.c: %.y
	$(BISON) -o $@ -dyv $<

test%: %.app
	./$*.$(EXT) ./test/$*/code.txt

test: test1 test2 test3

clean:
	rm -f *.yy.* *.app *.tab.* *.output

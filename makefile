CC=gcc
FLAGS=-DUNROLL -DDP -Ofast

linpack: linpack.c
	${CC} $< -o $@ ${FLAGS}

.PHONY: clean
clean:
	rm -f linpack Linpack.txt

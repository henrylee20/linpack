CC=gcc
FLAGS=-DUNROLL -DDP

linpack: linpack.c
	${CC} $< -o $@ ${FLAGS}

.PHONY: clean
clean:
	rm -f linpack Linpack.txt

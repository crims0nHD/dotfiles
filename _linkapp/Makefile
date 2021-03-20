SRCDIR = ./src
OBJDIR = ./obj
BINDIR = ./bin

LIBS = -lncurses -lmenu

build: linkapp

linkapp: main.o
	gcc -o $(BINDIR)/linkapp $(OBJDIR)/main.o $(LIBS) 

main.o:
	gcc -c -o $(OBJDIR)/main.o $(SRCDIR)/main.c

clean:
	rm $(OBJDIR)/*
	rm $(BINDIR)/*

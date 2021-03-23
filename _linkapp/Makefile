SRCDIR = ./src
OBJDIR = ./obj
BINDIR = ./bin

LIBS = -lncurses -lmenu
CFLAGS = -Wall -g

SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(patsubst %.c, %.o, $(patsubst $(SRCDIR)/%, $(OBJDIR)/%, $(SRCS)))

build: linkapp

linkapp: $(OBJS)
	@echo $(OBJS)
	gcc $(CFLAGS) -o $(BINDIR)/linkapp $(OBJS) $(LIBS) 

obj/%.o: src/%.c
	gcc $(CFLAGS) -c $< -o $@

clean:
	rm $(OBJDIR)/*
	rm $(BINDIR)/*

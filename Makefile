#!/usr/bin/make

SHELL = /bin/bash

SRCDIR = .
INCDIR = .
OBJDIR = .
EXEDIR = .

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC))
EXE = $(EXEDIR)/a.out

CC = gcc
CFLAGS = -Wall -std=c99 -I$(INCDIR)

.PHONY: all bench clean debug

all: debug

debug: CFLAGS += -g -O0 -DDEBUG
debug: $(EXE)
	$(EXE)

bench: CFLAGS += -O3
bench: $(EXE)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(EXE): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	-rm -rvf $(OBJDIR)/*.o $(EXEDIR)/*.exe $(EXEDIR)/*.out

CC = gcc				#
CFLAGS = -Wall -Ilib	# -Wall show more warnings
LDFLAGS = 				#

SRC_DIR = src
LIB_DIR = lib
OBJ_DIR = build
BIN_DIR = bin

# find source file
LIB_SRCS = $(wildcard $(LIB_DIR)/*c)
SRC_SRCS = $(wildcard $(SRC_DIR)/**/*.c)

# transfer to obj file
LIB_OBJS = $(patsubst $(LIB_DIR)/%.c, $(OBJ_DIR)/%.o, $(LIB_SRCS))
SRC_OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_SRCS))


EXECS = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%, $(SRC_SRCS))

# *****************************************************************
# upon Related cariable declarations
# below is the rule of compile

all: $(EXECS)

# Rule to link each executable
$(BIN_DIR)/%: $(OBJ_DIR)/%.o $(LIB_OBJS)
	mkdir -p $(@D)
	$(CC) $(LDFLAGS) -o $@ $^

# Rule to compile library objects
$(OBJ_DIR)/%.o: $(LIB_DIR)/%.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile source objects
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR)/* $(BIN_DIR)/*

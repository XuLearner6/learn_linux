CC = gcc				#
CFLAGS = -Wall -Ilib	# -Wall show more warnings
LDFLAGS = 				#

SRC_DIR = src
LIB_DIR = lib
OBJ_DIR = build

# find source file
LIB_SRCS = $(wildcard $(LIB_DIR)/*c)
SRC_SRCS = $(wildcard $(SRC_DIR)/**/*.c)

# transfer to obj file
LIB_OBJS = $(patsubst $(LIB_DIR)/%.c, $(OBJ_DIR)/%.o, $(LIB_SRCS))
SRC_OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_SRCS))


EXEC = app.out
# *****************************************************************
# upon Related cariable declarations
# below is the rule of compile

all: $(EXEC)

$(EXEC): $(LIB_OBJS) $(SRC_OBJS)
	$(CC) $(LDFLAGS) -o $(OBJ_DIR)/$@ $^

$(OBJ_DIR)/%.o: $(LIB_DIR)/%.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR)/**










.PHONY: clean
	rm -rf *.o                       
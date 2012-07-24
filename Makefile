SHLIB_NAME = EasySandbox.so

CFLAGS = -g -Wall -D_GNU_SOURCE -fPIC $(DEBUG)

SRCS = EasySandbox.c memmgr.c
OBJS = $(SRCS:.c=.o)

TEST_SRCS = test1.c test2.c test3.c
TEST_EXES = $(TEST_SRCS:.c=)

all : $(SHLIB_NAME) $(TEST_EXES)

$(SHLIB_NAME) : $(OBJS)
	gcc -shared -o $@ $(OBJS) -ldl

test% : test%.o
	gcc -o $@ test$*.o

runtests :
	./runalltests.sh $(TEST_EXES)

clean :
	rm -f *.o *.so

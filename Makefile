CC = /home/keith/Tools/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-gcc
CFLAGS = -c -mcpu=cortex-m4 -mthumb -std=gnu11 -O0

all: main

main.o: main.c
	${CC} ${CFLAGS} $^ -o $@
led.o: led.c
	${CC} ${CFLAGS} $^ -o $@
main.s: main.c
	${CC} -S -mcpu=cortex-m4 -mthumb -std=gnu11 $^ -o $@ 
test.o: test.c
	${CC} ${CFLAGS} $^ -o $@
test.s: test.c
	${CC} -S -mcpu=cortex-m4 -mthumb -std=gnu11 $^ -o $@
clean:
	rm *.o main.s test.s *.log

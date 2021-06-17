CC = /home/keith/Tools/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-gcc
CFLAGS = -c -mcpu=cortex-m4 -mthumb -std=gnu11 -O0 -Wall
LFLAGS = -nostdlib -T
LINKER = stm32_ls.ld

all: final.elf

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
stm32_startup.o: stm32_startup.c
	${CC} ${CFLAGS} $^ -o $@

final.elf: main.o led.o stm32_startup.o
	${CC} ${LFLAGS} ${LINKER} -Wl,-Map=final.map  $^ -o $@

clean:
	rm *.o main.s test.s *.log *.map *.elf

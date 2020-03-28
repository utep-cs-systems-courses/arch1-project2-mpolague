all: libTimer2.a

CPU 		= msp430g2553
CFLAGS	 	= -mmcu=${CPU}

CC		= msp430-elf-gcc
AS 		= msp430-elf-as
AR 		= msp430-elf-ar

libTimer2.a: clocksTimer2.o sr2.o
	 $(AR) crs $@ $^

install: libTimer2.a
	mkdir -p ../h2 ../lib2
	mv $^ ../lib2
	cp *.h ../h2

clean:
	rm -f timerLib2.a *.o

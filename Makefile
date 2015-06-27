CFLAGS = -g -O2 -shared -fPIC -Wall -pedantic
LDFLAGS = -lSoundTouch

all: app_parrot.so

app_parrot.so: app_parrot.o voicechanger.o
	g++ $(CFLAGS) -o $@ $^ $(LDFLAGS)

app_parrot.o: app_parrot.c
	gcc $(CFLAGS) --std=gnu99 -c -o $@ $<

voicechanger.o: voicechanger.cpp
	g++ $(CFLAGS) -c -o $@ $<

install: all
	cp -av app_parrot.so /usr/lib/asterisk/modules/

clean:
	rm -f *.o *.so

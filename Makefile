SRCDIR=.
CC=/opt/EmbedSky/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc 
CFLAGS = -std=c99 -g -I /usr/local/arm-alsa-lib-install/include/
LDFLAGS =-L /usr/local/arm-alsa-lib-install/lib/ -lasound
TARGETS=lplay lrecord
all: $(TARGETS)

lplay:lplay.o sndwav_common.o wav_parser.o
	$(CC)  $(CFLAGS) -o $@  $^ $(LDFLAGS)
lrecord:lrecord.o sndwav_common.o wav_parser.o
	$(CC)  $(CFLAGS) -o $@  $^ $(LDFLAGS)
sndwav_common.o:sndwav_common.c
	$(CC)  $(CFLAGS) -o $@ -c $< $(LDFLAGS)
sndwav_parser.o:wav_parser.c
	$(CC)  $(CFLAGS) -o $@ -c $< $(LDFLAGS)


clean:
	rm -f *.o ${TARGETS}

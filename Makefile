CC ?= clang
PKGCONFIG = $(shell which pkg-config)
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk4)
LIBS = $(shell $(PKGCONFIG) --libs gtk4)
SRC = sisyphus.c
OBJS = $(SRC:.c=.o)

all: sisyphus

%.o: %.c
	$(CC) -c -o $(@F) $(CFLAGS) $<

sisyphus: $(OBJS)
	$(CC) -o $(@F) $(OBJS) $(LIBS)

clean:
	rm -rf $(OBJS)
	rm -f sisyphus

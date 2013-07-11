CC?=		clang
AR?=		ar
INSTALL?=	install
PREFIX?=	/usr/local

all: libbson

libbson:
	$(CC) -c -fPIC -I./bson -DBSON_COMPILATION -DBSON_BYTE_ORDER=1234 -g -O2 -Wall -Werror ./bson/bson.c ./bson/bson-context.c ./bson/bson-clock.c ./bson/bson-error.c ./bson/bson-iter.c ./bson/bson-keys.c ./bson/bson-md5.c ./bson/bson-memory.c ./bson/bson-oid.c ./bson/bson-reader.c ./bson/bson-string.c ./bson/bson-utf8.c ./bson/bson-writer.c
	$(AR) rvs libbson.a bson-clock.o bson-context.o bson-error.o bson-iter.o bson-keys.o bson-md5.o bson-memory.o bson-oid.o bson-reader.o bson-string.o bson-utf8.o bson-writer.o
	$(CC) -shared -fPIC -o libbson.so bson-clock.o bson-context.o bson-error.o bson-iter.o bson-keys.o bson-md5.o bson-memory.o bson-oid.o bson-reader.o bson-string.o bson-utf8.o bson-writer.o

install:
	mkdir $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/b64_ntop.h	$(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-clock.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-context-private.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-context.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-endian.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-error.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-iter.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-keys.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-macros.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-md5.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-memory.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-oid.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-private.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-reader.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-string.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-thread.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-types.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-utf8.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-version.h.in $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-writer.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-stdint.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./bson/bson-version.h $(PREFIX)/include/bson
	$(INSTALL) -m 644 ./libbson.so $(PREFIX)/lib
	$(INSTALL) -m 644 ./libbson.a $(PREFIX)/lib

clean:
	rm -f libbson.a
	rm -f libbson.so
	rm -f *.o

deinstall:
	rm -Rf $(PREFIX)/include/bson
	rm -f $(PREFIX)/lib/libbson.so
	rm -f $(PREFIX)/lib/libbson.a


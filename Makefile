INSTALLDIR=/usr/local
INSTALLLIB=$(INSTALLDIR)/lib

CFLAGS=-O3 -fpic

SONAME=libmurmer.so.1
LIBNAME=$(SONAME).0.1

$(LIBNAME):	PMurHash.o
		$(CC) -shared -Wl,-soname,$(SONAME) -o $(LIBNAME) PMurHash.o -lc

PMurHash.o:	PMurHash.c

all:		$(LIBNAME)

default:	all

clean:		
		rm -f *~ *.o $(LIBNAME)

install:	$(LIBNAME)
		install -d $(INSTALLLIB)
		install $(LIBNAME) $(INSTALLLIB)
		ldconfig $(INSTALLLIB)

		

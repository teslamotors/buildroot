# Crummy replacement makefile for qpOASES_e.  The original was someone's cry for help.

PREFIX         ?= /usr
SO             := libqpOASES_e.so
# oe_runmake completely overrides CFLAGS. Ugh.
LOCAL_CFLAGS += -fPIC -D__NO_COPYRIGHT__ -O3 -finline-functions -Wall -pedantic -Wfloat-equal -Wshadow -DLINUX -I. -I. -Iinclude -Isrc

# cd src; find . -type f -name '*.c' | sed 's,./,CFILES += ,'
CFILES += Options.c
CFILES += Indexlist.c
CFILES += QProblem.c
CFILES += Utils.c
CFILES += Constraints.c
CFILES += Bounds.c
CFILES += Matrices.c
CFILES += Flipper.c
CFILES += MessageHandling.c
CFILES += QProblemB.c
CFILES += OQPinterface.c


# cd include; find . -type f | sed 's,./,INCLUDES += ,'
INCLUDES += qpOASES_e.h
INCLUDES += qpOASES_e/extras/OQPinterface.h
INCLUDES += qpOASES_e/QProblemB.h
INCLUDES += qpOASES_e/Types.h
INCLUDES += qpOASES_e/UnitTesting.h
INCLUDES += qpOASES_e/Options.h
INCLUDES += qpOASES_e/extras/OQPinterface.h
INCLUDES += qpOASES_e/Flipper.h
INCLUDES += qpOASES_e/Constants.h
INCLUDES += qpOASES_e/QProblem.h
INCLUDES += qpOASES_e/ConstraintProduct.h
INCLUDES += qpOASES_e/Constraints.h
INCLUDES += qpOASES_e/MessageHandling.h
INCLUDES += qpOASES_e/Bounds.h
INCLUDES += qpOASES_e/Indexlist.h
INCLUDES += qpOASES_e/Matrices.h
INCLUDES += qpOASES_e/Utils.h

.PHONY: all install clean

all: bin/$(SO)

install-dev: install
	install -d $(DESTDIR)$(PREFIX)/include
	install -d $(DESTDIR)$(PREFIX)/include/qpOASES_e
	install -d $(DESTDIR)$(PREFIX)/include/qpOASES_e/extras
	for f in $(INCLUDES); do install -m 0644 include/$$f $(DESTDIR)$(PREFIX)/include/$$f; done

install: all
	install -d $(DESTDIR)$(PREFIX)/lib
	install -m 0644 bin/$(SO) $(DESTDIR)$(PREFIX)/lib

bin/$(SO): $(foreach f,$(CFILES:.c=.o),src/$f)
	$(CC) -o $@ -shared $^ -lm

src/%.o: src/%.c
	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) -c $< -o $@

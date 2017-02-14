.SUFFIXES: .md .htm .html

.PHONY: all clean


MD= \
    Chapter00.md \
    Chapter01.md \
    Chapter02.md \
    Chapter03.md \
    Chapter04.md \
    Chapter05.md \
    Chapter06.md \
    Chapter07.md \
    Chapter08.md \
    Chapter09.md \
    Chapter10.md

HTM= $(patsubst %.md,%.htm,$(MD))

all: acks.html

clean:
	-rm $(HTM)
	-rm acks.html

acks.html: head.htm $(HTM) foot.htm
	cat head.htm $(HTM) foot.htm > acks.html

.md.htm:
	kramdown $< > $@

.htm.html:
	cat head.htm $< foot.htm > $@

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
    Chapter10.md \
    OGL.md

HTM= $(patsubst %.md,%.htm,$(MD))

HTML= $(patsubst %.md,%.html,$(MD))

all: index.html

clean:
	-rm $(HTM)
	-rm $(HTML)
	-rm index.html
	-rm acks.html

index.html: $(HTML)
	cp Chapter00.html index.html

acks.html: head.htm $(HTM) foot.htm
	cat head.htm $(HTM) foot.htm > $@

%.htm : %.md
	cat $< | \
		sed -E "s/Chapter([0-9][0-9])\.md/Chapter\1.html/g"  | \
		sed -E "s/OGL.md/OGL.html/g" | \
		kramdown > $@

%.html : %.htm
	cat head.htm $< foot.htm > $@

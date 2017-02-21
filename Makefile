.SUFFIXES: .md .html

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

HTML= $(patsubst %.md,%.html,$(MD))

all: index.html

clean:
	-rm $(HTML)
	-rm index.html

index.html: $(HTML)
	cp Chapter00.html index.html

%.html : %.md
	cat $< | \
		sed -E -e "s/Chapter([0-9][0-9])\.md/Chapter\1.html/g" -e "s/OGL.md/OGL.html/g" | \
		kramdown --template acks-template.htm > $@

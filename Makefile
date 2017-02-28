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

HTML= $(patsubst %.md,html/%.html,$(MD))

all: html/index.html

clean:
	-rm $(HTML)
	-rm html/index.html
	-rmdir html
	-rm acks.html

html/index.html: html $(HTML)
	cp html/Chapter00.html html/index.html

html:
	mkdir html

html/%.html : %.md acks-template.htm
	cat $< | \
		sed -E -e "s/Chapter([0-9][0-9])\.md/Chapter\1.html/g" -e "s/OGL.md/OGL.html/g" | \
		kramdown --template acks-template.htm > $@

acks.html : $(MD)
	cat $(MD) | \
		awk '/\[Previous\]/ { if (++count % 2 == 0) next; } 1' | \
		sed -E -e "s/Chapter([0-9][0-9])\.md//g" -e "s/OGL.md//g" | \
		kramdown --template acks-template.htm > $@

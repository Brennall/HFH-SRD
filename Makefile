.SUFFIXES: .md .html

.PHONY: all clean


MD=	Chapter01.md \
	Chapter02.md \
	Chapter03.md \
	Chapter04.md \
	Chapter05.md \
	Chapter06.md \
	Chapter07.md \
	Chapter08.md \
	Chapter09.md \
	Chapter10.md

HTML= $(patsubst %.md,%.html,$(MD))

all: acks.html

clean:
	-rm $(HTML)
	-rm acks.html

acks.html: head.htm $(HTML) foot.htm
	cat head.htm $(HTML) foot.htm > acks.html

.md.html:
	kramdown $< > $@


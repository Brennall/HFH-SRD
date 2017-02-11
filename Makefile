all: acks.html

acks.html: head.htm body.html foot.htm
	cat head.htm body.html foot.htm > acks.html

body.html: *.md
	kramdown *.md > body.html

clean:
	rm acks.html

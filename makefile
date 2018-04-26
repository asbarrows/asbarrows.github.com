TTOP = template/template-top.html
TBOTTOM = template/template-bottom.html

index.html: content/about-content.html css/style.css $(TTOP) $(TBOTTOM)
	./stitch.sh $(TTOP) $< $(TBOTTOM) >$@

content/about-content.html: markdown/about.md
	pandoc $< --output $@

events.html: content/events-content.html css/style.css $(TTOP) $(TBOTTOM)
	./stitch.sh $(TTOP) $< $(TBOTTOM) >$@

content/events-content.html: markdown/events.md
	pandoc $< --output $@

media.html: content/media-content.html css/style.css $(TTOP) $(TBOTTOM)
	./stitch.sh $(TTOP) $< $(TBOTTOM) >$@

content/media-content.html: markdown/media.md
	pandoc $< --output $@

talks.html: content/talks-content.html css/style.css $(TTOP) $(TBOTTOM)
	./stitch.sh $(TTOP) $< $(TBOTTOM) >$@

content/talks-content.html: markdown/talks.md
	pandoc $< --output $@

contact.html: content/contact-content.html css/style.css $(TTOP) $(TBOTTOM)
	./stitch.sh $(TTOP) $< $(TBOTTOM) >$@

content/contact-content.html: markdown/contact.md
	pandoc $< --output $@

.PHONEY: all clean

all: index.html contact.html events.html media.html talks.html

clean:
	rm -rf index.html content contact.html media.html

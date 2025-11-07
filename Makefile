PROJECT := $(notdir $(realpath .))

ADOC_OPTS := -B $(PWD) --failure-level WARN -r asciidoctor-diagram

sources  := $(wildcard *.adoc)
targets  := $(patsubst %.adoc,%,$(sources))

.PHONY: clean all pdf html md

all: bpmn.pic pdf

pdf: $(targets:=.pdf)

html: $(targets:=.html)

md: $(targets:=.md)

docbook: $(targets:=.xml)

$(targets): %: %.html %.pdf

bpmn.pic: src/bpmn.pic
	cp $< $@

src/bpmn.pic:
	$(MAKE) -C src

%.pdf: %.adoc
	asciidoctor-pdf $(ADOC_OPTS) -o $@ $<

%.html: %.adoc
	asciidoctor $(ADOC_OPTS) -o $@ $<

clean:
	rm -rf *.pdf *.xml *.html bpmn.pic
	make -C src clean


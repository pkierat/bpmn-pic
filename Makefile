PROJECT := $(notdir $(realpath .))

ADOC_OPTS := -B $(PWD) --failure-level WARN -r asciidoctor-diagram

sources  := $(wildcard *.adoc)
targets  := $(patsubst %.adoc,%,$(sources))
images   := $(patsubst %.pic,%.svg,$(shell find img -name '*.pic'))

.PHONY: clean all pdf html md

all: bpmn.pic pdf

pdf: $(targets:=.pdf)

html: $(targets:=.html)

$(targets): %: %.html %.pdf

bpmn.pic: src/bpmn.pic
	cp $< $@

src/bpmn.pic:
	$(MAKE) -C src

%.svg: %.pic
	dpic -v $< > $@

%.pdf: %.adoc $(images)
	asciidoctor-pdf $(ADOC_OPTS) -o $@ $<

%.html: %.adoc $(images)
	asciidoctor $(ADOC_OPTS) -o $@ $<

clean:
	rm -rf *.pdf *.html bpmn.pic $(images)
	make -C src clean


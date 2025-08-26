# Makefile for compiling the presentation manual and slides

MAIN = student_research_excellence_guide
SLIDES = student_research_excellence_guide_slides
LATEX = pdflatex
BIBTEX = bibtex

all: $(MAIN).pdf $(SLIDES).pdf

$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

$(SLIDES).pdf: $(SLIDES).tex
	$(LATEX) $(SLIDES)
	$(LATEX) $(SLIDES)

manual: $(MAIN).pdf

slides: $(SLIDES).pdf

clean:
	rm -f $(MAIN).aux $(MAIN).log $(MAIN).nav $(MAIN).out $(MAIN).snm $(MAIN).toc $(MAIN).vrb $(MAIN).bbl $(MAIN).blg
	rm -f $(SLIDES).aux $(SLIDES).log $(SLIDES).nav $(SLIDES).out $(SLIDES).snm $(SLIDES).toc $(SLIDES).vrb $(SLIDES).bbl $(SLIDES).blg

distclean: clean
	rm -f $(MAIN).pdf $(SLIDES).pdf

.PHONY: all manual slides clean distclean

# Crib notes
#
# $@  The file name of the target.
# $<  The name of the first dependency.
# $*  The part of a filename which matched a suffix rule.
# $?  The names of all the dependencies newer than the target separated by spaces.
# $^  The names of all the dependencies separated by spaces, but with duplicate names removed.
# $+  The names of all the dependencies separated by spaces with duplicate names included and in the same order as in the rule.
#

MKMINIM=mkminim
PDFCONV=/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf
# Apache oppenoffice doesn't support this...
# PDFCONV=/Applications/OpenOffice.org.app/Contents/MacOS/soffice -headless -convert-to pdf

TARGETS_RDF=minim-chembox-samples.rdf \
	minim-workflow-runnable.rdf \
	minim-simple-requirements.rdf \
	minim-workflow-demo.rdf

TARGETS_PDF=minim-chembox-samples.pdf \
	minim-workflow-runnable.pdf \
	minim-simple-requirements.pdf \
	minim-workflow-demo.pdf

%.rdf : %.xls ; $(MKMINIM) -o xml $< >$@

%.pdf : %.xls ; $(PDFCONV) $<

all: allrdf allpdf

allrdf: $(TARGETS_RDF)

allpdf: $(TARGETS_PDF)

clean:
	rm *.rdf *.ttl *.pdf


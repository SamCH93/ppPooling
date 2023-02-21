all: pdf clean

# names of .Rnw .bib. and .bst files
FILE = pppooling
BIB = bibliography
BIBSTYLE = apalikedoiurl

## generate .tex file from .Rnw file with knitr
tex: $(FILE).Rnw $(BIB).bib $(BIBSTYLE).bst
	Rscript -e "knitr::knit('$(FILE).Rnw')" --vanilla

## generate .pdf file from .tex file
pdf: tex
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

## generate .pdf file from .tex (without first running the tex recipe)
pdf2:
	pdflatex $(FILE)
	bibtex $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

## clean
clean:  
	rm $(FILE).aux  $(FILE).blg  $(FILE).log  $(FILE).tex  $(FILE).bbl \
	$(FILE).out $(FILE).brf $(FILE).synctex.gz \
	$(FILE)Changes.aux  $(FILE)Changes.blg  $(FILE)Changes.log \
	$(FILE)Changes.tex  $(FILE)Changes.bbl $(FILE)Changes.out $(FILE)Changes.brf \
	$(FILE)Changes.tex $(FILE)Changes.synctex.gz; \
	rm -r ./figure/

texdiff: tex old/$(FILE).tex old/ld.cfg
	latexdiff -c old/ld.cfg old/$(FILE).tex  $(FILE).tex > $(FILE)Changes.tex
	-pdflatex $(FILE)Changes
	-bibtex $(FILE)Changes
	-pdflatex $(FILE)Changes
	-pdflatex $(FILE)Changes

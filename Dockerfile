## set R version (https://hub.docker.com/r/rocker/verse/tags)
FROM rocker/verse:4.2

## name of the manuscript (as in Makefile and paper/Makefile)
ENV FILE=pppooling

## should PDF be compiled within docker?
## by default set to False because tinytex takes ages to download and install
## LaTeX packages
ENV pdfdocker=false

## set up directories
RUN mkdir /output \
    && mkdir /analysis
COPY paper /analysis
COPY CRANpackages.txt /analysis
WORKDIR /analysis

## install R packages from CRAN the last day of the specified R version;
## - add packages required for the analysis to the CRANpackages.txt file
## - increase ncpus when installing many packages (and more than 1 CPU available)
RUN install2.r --error --skipinstalled --ncpus -1 \
    `cat CRANpackages.txt`

## knit Rnw to tex and compile tex to PDF
CMD if [ "$pdfdocker" = "false" ] ; then \
    echo "compiling PDF outside Docker" \
    ## knit Rnw to tex and compile tex outside docker to PDF
    && make tex \
    && mv "$FILE".tex /output \
    && mkdir -p /output/figure \
    && mv figure/* /output/figure/ ; \
    else \
    echo "compiling PDF inside Docker" \
    && Rscript -e "tinytex::install_tinytex()" --vanilla \
    ## knit Rnw to tex and compile tex inside docker to PDF
    && Rscript -e "knitr::knit2pdf('"$FILE".Rnw')" --vanilla \
    && mv "$FILE".pdf  /output/ ; \
    fi \
    ## change file permission of output files
    && chmod -R 777 /output/

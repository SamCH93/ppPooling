# Complete Pooling is Impossible with Normalized Power Priors

This repository accompanies the preprint [Pawel et al.
(2022)](https://doi.org/10.48550/arXiv.XXXX.XXXXX).

## Reproducing the results

We provide two ways to reproduce the manuscript

1. *Reproduction with locally installed computational environment* (requires a
local installation of R and LaTeX)

Install first the required R packages by running in a shell from the root
directory of the repository

``` sh
R -e 'install.packages(read.delim("CRANpackages.txt", header = FALSE)[,1])'
```

Then run

``` sh
cd paper
make pdf
```

this reproduces all analyses and outputs the file `pppooling.pdf` in the paper
directory. The R and package versions which we used can be seen in the output of
the sessionInfo command at the bottom of the manuscript.

2. *Reproduction within Docker container* (requires Docker with root rights)

Run in a shell from the root directory of the repository

``` sh
make drunpdf
```

which outputs the file `pppooling.pdf` in the paper directory. This takes a bit
longer but reruns our analyses in a Docker container which encapsulates the
computational environment (R and R versions) that was used in the original
analysis.

## References

* Pawel, S., Aust, F., Held, L., and Wagenmakers, E.-J. (2022). Complete Pooling
  is Impossible with Normalized Power Priors. to appear soon on arXiv.
  [10.48550/arXiv.XXXX.XXXXX](https://doi.org/10.48550/arXiv.XXXX.XXXXX)

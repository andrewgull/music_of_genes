# Music of genes
 encode DNA sequences into notes (a very early attempt)


## Description

the first approach is simple: every nucleotide corresponds to one note.

A - A (la)

G - G (sol)

C - C (do)

T - there is no note called T, so it will be E (mi) because A+C+G+E make up Am7 chord.

That's the basic principle, everything else can vary

## Requirements:

[gm](https://cran.r-project.org/web/packages/gm/index.html) for music representation

[Biostrings](https://bioconductor.org/packages/release/bioc/html/Biostrings.html) for parsing DNA sequences

[purrr](https://purrr.tidyverse.org/) for functional programming
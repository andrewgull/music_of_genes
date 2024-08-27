#### The first gene-to-music encoding ####
# Four nucleotides - Four notes

# AGCT - la sol do ...
# Am7 - ACEG

#### gm example ####

install.packages("gm")

library(gm)

music <- 
  Music() +
  Meter(4, 4) +
  Line(c("C5", "D5", "E5", "F5"))

show(music)

#### Gene examples ####

# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")

# BiocManager::install("Biostrings")

# library(Biostrings)

ecoli_reca <- as.character(Biostrings::readDNAStringSet("data/ecoli_reca_gene.fna"))
mtub_reca <- as.character(Biostrings::readDNAStringSet("data/mtub_reca_gene.fna"))
tthe_reca <- as.character(Biostrings::readDNAStringSet("data/tthe_reca_gene.fna"))
spne_reca <- as.character(Biostrings::readDNAStringSet("data/spne_reca_gene.fna"))

#### Mapping ####
install.packages("purrr")

char2note <- function(dna_char, octave = "1") {
  if (dna_char == "A" |
      dna_char == "G" | dna_char == "C") {
    note <- dna_char
  }
  else if (dna_char == "T") {
    note <- "E"
  }
  note_octave <- paste0(note, octave)
  return(note_octave)
}

gene_vec <- unlist(strsplit(substr(ecoli_reca[[1]], 1, 224), split = ""))
gene_vec2 <- unlist(strsplit(substr(mtub_reca[[1]], 1, 108), split = ""))
gene_vec3 <- unlist(strsplit(substr(tthe_reca[[1]], 1, 104), split = ""))
gene_vec4 <- unlist(strsplit(substr(spne_reca[[1]], 1, 50), split = ""))

notes_vec <- purrr::map_vec(gene_vec, ~ char2note(., octave = 6))
notes_vec2 <- purrr::map_vec(gene_vec2, ~ char2note(., octave = 5))
notes_vec3 <- purrr::map_vec(gene_vec3, ~ char2note(., octave = 4))
notes_vec4 <- purrr::map_vec(gene_vec4, ~ char2note(., octave = 3))

#### add things together ####

gene_music <- 
  Music() +
  Meter(3, 4) +
  Line(notes_vec, durations = 1/2) +
  Line(notes_vec2, offset = 4, durations = "quarter") +
  Line(notes_vec3, offset = 8, durations = "quarter") +
  Line(notes_vec4, offset = 12, durations = "half")

gm::show(gene_music)

gm::export(gene_music, path = "music/recA_fugue_34.mid")
gm::export(gene_music, path = "music/recA_fugue_34.mp3")

#### Further ideas ####
# Same species: canon, phasing?

#### Fugue ####
gene_vec <- unlist(strsplit(substr(ecoli_reca[[1]], 1, 240), split = ""))
gene_vec2 <- unlist(strsplit(substr(ecoli_reca[[1]], 1, 114), split = ""))
gene_vec3 <- unlist(strsplit(substr(ecoli_reca[[1]], 1, 108), split = ""))
gene_vec4 <- unlist(strsplit(substr(ecoli_reca[[1]], 1, 52), split = ""))

notes_vec <- purrr::map_vec(gene_vec, ~ char2note(., octave = 6))
notes_vec2 <- purrr::map_vec(gene_vec2, ~ char2note(., octave = 5))
notes_vec3 <- purrr::map_vec(gene_vec3, ~ char2note(., octave = 4))
notes_vec4 <- purrr::map_vec(gene_vec4, ~ char2note(., octave = 2))

gene_music <- 
  Music() +
  Meter(3, 4) +
  Line(notes_vec, durations = 1/2) +
  Line(notes_vec2, offset = 6, durations = "quarter") +
  Line(notes_vec3, offset = 12, durations = "quarter") +
  Line(notes_vec4, offset = 18, durations = "half")

gm::show(gene_music)

gm::export(gene_music, path = "music/recA_ecoli_fugue_34.mid")
gm::export(gene_music, path = "music/recA_ecoli_fugue_34.mp3")

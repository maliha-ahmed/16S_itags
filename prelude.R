library(dada2); packageVersion("dada2")
library(ShortRead); packageVersion("ShortRead")
library(ggplot2); packageVersion("ggplot2")

# all the fastq files should live here
path <- "data/itags/"

# this file has all the filenames, barcodes and sample namess
sample.map <- read.table("1.create_sample_map.txt", header=F, sep='\t', col.names=c("sample", "filename", "forward", "reverse"),  colClasses = "character")
sample.map$barcode <- sapply(strsplit(sample.map$filename, ".", fixed=T), `[`, 4)
head(sample.map)

# select out the forward and reverse
fnFs <- sample.map$forward
head(fnFs)

fnRs <- sample.map$reverse
head(fnRs)

# filtered filenames
filt_path <- paste0(path, "filtered")
if(!file_test("-d", filt_path)) dir.create(filt_path)
filtFs <- file.path(filt_path, paste0(sample.map$sample, "_F_filt.fastq.gz"))
filtRs <- file.path(filt_path, paste0(sample.map$sample, "_R_filt.fastq.gz"))


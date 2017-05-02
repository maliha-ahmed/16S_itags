library(dada2); packageVersion("dada2")
library(ShortRead); packageVersion("ShortRead")
library(ggplot2); packageVersion("ggplot2")

# all the fastq files should live here
path <- "data/itags/"

# this file has all the filenames, barcodes and sample namess
sample.map <- read.table("sample_info.xls", header=T, sep='\t', col.names=c("sample", "barcode", "linker", "barcode_name", "project_name", "description", "forward", "reverse") ,  colClasses = "character")
head(sample.map)

# select out the forward and reverse
fnFs <- unique(sample.map$forward)
head(fnFs)

fnRs <- unique(sample.map$reverse)
head(fnRs)

# filtered filenames
filt_path <- paste0(path, "filtered")
if(!file_test("-d", filt_path)) dir.create(filt_path)
filtFs <- file.path(filt_path, paste0(sample.map$sample, "_F_filt.fastq.gz"))
filtRs <- file.path(filt_path, paste0(sample.map$sample, "_R_filt.fastq.gz"))


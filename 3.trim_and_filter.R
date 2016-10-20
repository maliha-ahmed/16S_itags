source("prelude.R")

filt_path <- paste0(path, "filtered")
if(!file_test("-d", filt_path)) dir.create(filt_path)
filtFs <- file.path(filt_path, paste0(sample.map$sample, "_F_filt.fastq.gz"))
filtRs <- file.path(filt_path, paste0(sample.map$sample, "_R_filt.fastq.gz"))

# We’ll use standard filtering parameters: maxN=0 (DADA2 requires no Ns), truncQ=2 (quality score 2 in Illumina means “stop using this read”) and maxEE=2. The maxEE parameter sets the maximum number of “expected errors” allowed in a read, which is a better filter than simply averaging quality scores. We use the fastqPairedFilter function to jointly filter the forward and reverse reads.

for(i in seq_along(fnFs)) {
  fastqPairedFilter(c(fnFs[i], fnRs[i]), c(filtFs[i], filtRs[i]),
                    trimLeft=c(10, 10), truncLen=c(240,160), 
                    maxN=0, maxEE=2, truncQ=2, 
                    compress=TRUE, verbose=TRUE)
}

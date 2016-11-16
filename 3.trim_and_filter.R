source("prelude.R")

# We’ll use standard filtering parameters: maxN=0 (DADA2 requires no Ns), truncQ=2 (quality score 2 in Illumina means “stop using this read”) and maxEE=2. The maxEE parameter sets the maximum number of “expected errors” allowed in a read, which is a better filter than simply averaging quality scores. We use the fastqPairedFilter function to jointly filter the forward and reverse reads.

for(i in seq_along(fnFs)) {
  fastqPairedFilter(c(paste0(path, fnFs[i]), paste0(path, fnRs[i])), c(filtFs[i], filtRs[i]),
                    trimLeft=c(10, 10), truncLen=c(270,200), 
                    maxN=0, maxEE=2, truncQ=2, 
                    compress=TRUE, verbose=TRUE)
}

source("prelude.R")

derepFs <- derepFastq(filtFs, verbose=TRUE)
derepRs <- derepFastq(filtRs, verbose=TRUE)
# Name the derep-class objects by the sample names
names(derepFs) <- sample.map$samples
names(derepRs) <- sample.map$samples

save(derepFs, derepRs, file='4.dereplication.Rd')

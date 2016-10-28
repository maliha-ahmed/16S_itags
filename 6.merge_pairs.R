source("prelude.R")

load("5.sample_inference.Rd")

mergers <- mergePairs(dadaFs, derepFs, dadaRs, derepRs, verbose=TRUE)
seqtab <- makeSequenceTable(mergers[names(mergers) != "Mock"])

dim(seqtab)

table(nchar(colnames(seqtab)))

save(mergers, seqtab, file="6.merge_pairs.Rd")

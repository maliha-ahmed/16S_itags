source("prelude.cpp")

load("6.merge_pairs.Rd")

seqtab.nochim <- removeBimeraDenovo(seqtab, verbose=TRUE)
dim(seqtab.nochim)

sum(seqtab.nochim)/sum(seqtab)

save(seqtab.nochim, file="7.chimera_removal.Rd")

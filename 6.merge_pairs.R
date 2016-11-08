source("prelude.R")

load("5.sample_inference.Rd")

mergers <- mergePairs(dadaFs, derepFs, dadaRs, derepRs, verbose=TRUE)
seqtab <- makeSequenceTable(mergers)

dim(seqtab)

table(nchar(colnames(seqtab)))

# write sequences to fasta per sample for usearch otu clustering 
for (j in seq_len(nrow(seqtab))) {
	for (i in seq_len(ncol(seqtab))) {
		if (seqtab[j,i]>0)
			cat(paste0(">sample=",rownames(seqtab)[j],";seq_",i,";size=",seqtab[j,i],";","\n",colnames(seqtab)[i]),"\n", file=paste0("combined.filtered.fasta"), append=TRUE)
 	}
}

save(mergers, seqtab, file="6.merge_pairs.Rd")

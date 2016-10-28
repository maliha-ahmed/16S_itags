source("prelude.R")

load("7.chimera_removal.Rd")

taxa <- assignTaxonomy(seqtab.nochim, "rdp_train_set_14.fa.gz")
colnames(taxa) <- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus")
unname(head(taxa))

save(taxa, file="8.assign_taxonomy.Rd")

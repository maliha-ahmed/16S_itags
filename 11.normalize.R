#!/usr/bin/env Rscript

library(docopt)

library("BiocParallel")
register(MulticoreParam(16))

"Usage: 11.normalize.R [-h] <infilename> <logoutfilename> <vsdoutfilename>

-h --help       show this
infilename      name of OTU input file
logoutfilename  name of the log normalized output file
vsdoutfilename  name of the vsd normalized output file" -> doc
args <- docopt(doc)

library(DESeq2)

d <- read.delim(args$infilename, header=T, row.names=1)
head(d)

e <- d[, -which(names(d) %in% c("domain", "domain_confidence", "phylum", "phylum_confidence", "class", "class_confidence", "order_", "order_confidence", "family", "family_confidence", "genus", "genus_confidence", "species", "species_confidence", "sequence"))]
head(e)

s <- read.delim('sample_map.tsv', header=T, row.names=1)

eexp <- data.frame(row.names=colnames(e), sample=colnames(e), methane=s$methane, oxygen=s$oxygen, nitrogen=s$nitrogen_source, days=factor(s$days), expt=factor(c(rep(1, 66), rep(2, 112))))
eexp
#dds <- DESeqDataSetFromMatrix(countData=e, colData=eexp, design=~methane+oxygen+nitrogen+days)
dds <- DESeqDataSetFromMatrix(countData=e, colData=eexp, design=~sample)
#methane+oxygen+nitrogen+days+expt)

ddrs <- DESeq(dds)

rld <- rlogTransformation(ddrs, blind=TRUE)
vsd <- varianceStabilizingTransformation(ddrs, blind=TRUE)

normCounts <- assay(rld)
normD <- cbind(normCounts, d[, which(names(d) %in% c("domain", "domain_confidence", "phylum", "phylum_confidence", "class", "class_confidence", "order_", "order_confidence", "family", "family_confidence", "genus", "genus_confidence", "species", "species_confidence", "sequence"))])
write.table(format(normD, digits=2), file=args$logoutfilename, quote=FALSE, sep='\t', col.names=NA)

normCounts <- assay(vsd)
normD <- cbind(normCounts, d[, which(names(d) %in% c("domain", "domain_confidence", "phylum", "phylum_confidence", "class", "class_confidence", "order_", "order_confidence", "family", "family_confidence", "genus", "genus_confidence", "species", "species_confidence", "sequence"))])
write.table(format(normD, digits=2), file=args$vsdoutfilename, quote=FALSE, sep='\t', col.names=NA)

save(eexp, dds, ddrs, rld, vsd, file="11.normalize.Rd")

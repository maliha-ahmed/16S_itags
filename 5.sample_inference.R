source("prelude.R")

load("4.dereplication.Rd")

dadaFs <- dada(derepFs, err=NULL, selfConsist = TRUE, multithread=TRUE)
dadaRs <- dada(derepRs, err=NULL, selfConsist = TRUE, multithread=TRUE)

pdf("5.sample_inference.pdf")

print(plotErrors(dadaFs, nominalQ=TRUE))
print(plotErrors(dadaRs, nominalQ=TRUE))

dev.off()

save(dadaFs, dadaRs, derepFs, derepRs,  "5.sample_inference.Rd")

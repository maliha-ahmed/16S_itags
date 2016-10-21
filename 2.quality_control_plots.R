#!/home/dacb/miniconda2/bin/R -f

source("prelude.R")

pdf("2.quality_control_plots.pdf")

# forward
for (i in 1:length(fnFs)) {
    print(plotQualityProfile(paste0(path, fnFs[[i]])))
}

# reverse
for (i in 1:length(fnRs)) {
    print(plotQualityProfile(paste0(path, fnRs[[i]])))
}

dev.off()

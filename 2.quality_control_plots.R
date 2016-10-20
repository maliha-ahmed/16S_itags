#!/home/dacb/miniconda2/bin/R -f

source("prelude.R")

pdf("2.quality_control_plots.pdf")

# forward
for(val in 1:length(fnFs)) {
    plotQualityProfile(paste0(path, fnFs[[1]]))
}

# reverse
for(val in 1:length(fnRs)) {
    plotQualityProfile(paste0(path, fnRs[[1]]))
}

dev.off()

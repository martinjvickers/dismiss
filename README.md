# dismiss
DISMISS is an R script, which as an additional step in MeDIP-Seq data analysis workflow, enables the allocation of strands to methylated DNA regions. It does this by analyzing the proportions of first mate reads aligning to the methylated locus from the plus and minus strands.

Requires bioconductor with the GenomicAlignments and GenomicFeatures packages;

e.g.

source("http://bioconductor.org/biocLite.R")

biocLite(c("GenomicFeatures", "GenomicAlignments"))

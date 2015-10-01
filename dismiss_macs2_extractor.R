# File: dismiss_macs2_extractor.R
# Auth: umn@aber.ac.uk, uhkniazi@gmail.com
# DESC: main script called from command line
#       1 - takes excel file name and bam file names are command line arguments
#       arg1 = excel file name
#       arg2 = bam file name (index file for bam should be in same directory)
#       arg3 = p (for paired end data) or s (for single end data)
# Date: 24/10/2014


# get command line arguments
args = commandArgs(trailingOnly = TRUE)
csHelp = 'Run script with: \nRscript dismiss_macs2_extractor.R MACS2_result.xls File.bam File.bai [p or s]'

# check argument size
if (args[1] == 'h' || args[1] == 'help' || length(args) != 4) stop(paste(csHelp))

# variable setting and some error checking
macs = args[1]
bam = args[2]
bai = args[3]
paired = NA
if (args[4] == 'p') { paired = TRUE
  } else if (args[4] == 's') paired = FALSE
if (is.na(paired)) stop(paste(csHelp))

# header file with functions
source(file='dismiss_header.R')

oGRdismiss = f_oGRMACS2toGRanges(macs)
oGRdismiss = f_oGRSeparateStrands(oGRdismiss, bam, bai, paired)

# save output to granges object 
name.out = paste('oGRdismiss_', make.names(date()), '.rds', sep='')
save(oGRdismiss, file = name.out)

# save output as gff3 files
f_WriteGff3(oGRdismiss)





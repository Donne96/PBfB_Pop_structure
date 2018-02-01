#!/usr/bin/env python
# load packages
import subprocess
import os
# set working directory
os.chdir("/home/donne/PopStruc/")

# load scripts
Rscript = "PCfB_testHW.R" # R script
Sscript = "PCfB_testSTRUCTURE.sh" # Shell script to run STRUCTURE

# start R script to test if loci heterozygosity depard from Hardy-Weinberg Equilibrium (HWE)
subprocess.call (["/usr/bin/Rscript","--vanilla", Rscript])
# 2 files created: output_Rscript.txt & output_Rscript_detailed.txt

# read output of R script
outputRscript = "output_Rscript.txt"
outputR = open(outputRscript,"rt")
contentR = outputR.read()
print contentR

# read content of output R script
ElementList = contentR.split('\n')
print "Percentage loci departing from HW =",ElementList[10],"%"# percentage loci departing from HW

# set threshold (set to 50% of sampled loci to depart from HWE)
Threshold = float(50.0)
# check if threshold has been exceeded
if float(ElementList[10]) >= Threshold:
    # infrom user threshold has been reached and start script for running structure
    print 'Treshhold passed'
    subprocess.call (["/bin/bash", Sscript])
else:
    # inform user threshold has not been reached
    print 'Threshold not passed'
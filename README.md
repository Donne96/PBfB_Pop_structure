# PBfB_Pop_structure

## Final project PBfB
Everything Titus Hielkema and I used for our end-project of the Practical Bioinformatics for Biologists (PBfB) 2018 course at the Rijksuniversiteit Groningen. Guided by M.C. Fontaine 

## Description
This script analyses data files containing microsatallite data. It tests and returns which loci and the percentage of loci depart from the Hardy-Weinberg Equilibrium (HWE). If threshold is reached (on default: 50% of loci departing from HWE) it will analyse the data for population structure which will run for various possible clusters (K) and does this repetetively for each K value.

## Setting up
In order to be able to run this script, the contents of this directory need to be placed within a folder called 'PopStruc' which is located in the home directory. As stated before the contents of this directory need to be placed within the PopStruc folder. 
The scripts refer to this folder, however the paths that direct to these files still contain my own username and should be replaced with the username of the computer on which the scripts are run. Thus, replace 'donne' in each pathway with your own username in the following files:

  mainparams: line 1 and 2
  Master_PopStruc.py: line 6
  PCfB_testHW.R: line 2
  PCfB_testSTRUCTURE.sh: line 4 and line 11 (4x)
  
 Also it is required structure is installed on the computer and its bin is added to your .bashrc.
 
 From this point the script can be ran from any directory.

## Data input
R requires a .xlsx file containing sample ID (with header), sample site & microsatalite date (alleles seperated using '/' for each locus).
Structure requires a .txt file containing sample ID (without header), sample site & microsatalite date (alleles seperated using '/' for each locus).

## Scripts
1. Python script: Main script
2. R script: Test if loci depart from HWE
3. Shell script: Analyse population structure using STRUCTURE software

### Python script
Main script that uses R and Shell scripts. This enables the script to be able to run by itself and could possibly be send to a computer cluster. Depending on the output of the R script and the threshold (default: 50%) it will run the Shell script or quit if less than 50% of the microsatellite data differs from HWE.

### R script
Analyse the heterozygosity of all loci by analyzing for each locus whether it departs from HWE (P < 0.05). It returns 2 files. output_Rscript.txt contains mean P vallue, total number of loci, loci significant and not significant departing from HWE and the percentage departing loci of the total. output_Rscript_detailed.txt contains output of the statistical test (hw.test) for each locus. 

### Shell script
This script is started if more than 50% (default) of the sampled loci differs from HWE. If desired, this default can be edited in the Master_PopStruc.py line 27. The shell script itself runs a double for loop. This loop does a number of repetitions (default: 10) for each K (default: 5). Any changes for the range of K values can be made in the first for loop in PCfB_testSTRUCTURE.sh line 9. The number of repetitions [rep] can be edited from the same script (PCfB_testSTRUCTURE.sh) in the same line (line 9), only in the second for loop. 
The script creates an directory to store the output of each separate run in Structure in the following format: outfile_kX_repX_f


### References:
**Article citing:**
Vignaud TM, Maynard JA, Leblois R, Meekan MG, Vázquez-Juárez R, Ramírez-Macías D, Pierce S, Rowat D, Berumen ML, Beeravolu C, Baksay S, Planes S (2014) Genetic structure of populations of whale sharks among ocean basins and evidence for their historic rise and recent decline. Molecular Ecology 23(10): 2590-2601. https://doi.org/10.1111/mec.12754
**Dryad reference:**
Vignaud TM, Maynard JA, Leblois R, Meekan MG, Vázquez-Juárez R, Ramírez-Macías D, Pierce SJ, Rowat D, Berumen ML, Beeravolu C, Baksay S, Planes S (2014) Data from: Genetic structure of populations of whale sharks among ocean basins and evidence for their historic rise and recent decline. Dryad Digital Repository. https://doi.org/10.5061/dryad.489s0
**Link to page:**
http://datadryad.org/resource/doi:10.5061/dryad.489s0
**Other references:**
https://www.biostars.org/p/264492/

#!/bin/bash

#A for loop is created within a for loop to create replicates for each K value
#3 is the number of replicates at each value of K.
#5 is the number of K for which structure is tested.
for k in {1..5}; do for rep in {1..3};
do 
structure -m Donne96/PBfB_Pop_structure/mainparams -e Donne96/PBfB_Pop_structure_extraparams -i Donne96/PBfB_Pop_structure/WS_struc_msat.txt -K ${k} -o /$HOME/Documents/Results_WSPopstruc/outfile_k${k}_rep${rep}
done
done

#!/bin/bash

#create directory for the structure output to be stored
mkdir -p ${HOME}/PBfB_Pop_structure/Results_WSPopstruc

#A for loop is created within a for loop to create replicates for each K value
#3 is the number of replicates at each value of K.
#5 is the number of K for which structure is tested.
for k in {1..5}; do for rep in {1..10};
do 
structure -m ${HOME}/PBfB_Pop_structure/mainparams -e ${HOME}/PBfB_Pop_structure_extraparams -i ${HOME}/PBfB_Pop_structure/WS_struc_msat.txt -K ${k} -o ${HOME}/PBfB_Pop_structure/Results_WSPopstruc/outfile_k${k}_rep${rep}
done
done

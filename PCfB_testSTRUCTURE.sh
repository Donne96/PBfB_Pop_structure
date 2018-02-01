#!/bin/bash

#create directory for the structure output to be stored
mkdir -p /home/donne/PopStruc/Results_struc

#A for loop is created within a for loop to create replicates for each K value
#3 is the number of replicates at each value of K.
#5 is the number of K for which structure is tested.
for k in {1..5}; do for rep in {1..10};
do 
structure -m /home/donne/PopStruc/mainparams -e /home/donne/PopStruc/extraparams -i /home/donne/PopStruc/WS_struc_msat.txt -K ${k} -o /home/donne/PopStruc/Results_struc/outfile_k${k}_rep${rep}
done
done
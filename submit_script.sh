#!/bin/sh


# Script to take list of subject names and performs 
# first level processing on Target Task files


mainDir="/MRIWork/MRIWork08/mt/aleksandra_herman/Insula_study"

while read -r newfile files outp;
do

 	echo 'Starting ICA-AROMA for ' ${newfile} ' at ' $(date '+%A %B %d Time:%H:%M')
	echo 'No is ' ${outp}

	qsub -q longq -o A1_job_${newfile}.txt -e A1_err_${newfile}.txt $mainDir/aroma_script.sh $mainDir/${newfile}/${outp}".feat"
						

echo 'Done'

done < $mainDir/list2.txt


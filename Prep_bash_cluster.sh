#!/bin/sh


# Script to take list of subject names and performs 
# first level processing on Target Task files


### Select the proper version of FSL

source /usr/local/apps/psycapps/config/fsl_bash

#directory where the files are stored
mainDir="/MRIWork/MRIWork08/mt/aleksandra_herman/Insula_study"

while read -r newfile files outp vol;
do

 	echo 'Starting Tactile1 feat preprocessing for ' ${newfile} ' at ' $(date '+%A %B %d Time:%H:%M')
	echo 'No is ' ${outp}
	echo 'volume is ' ${vol}
	# Replace place holder information in master fsf file	

	echo 'Editing master fsf and running Feat' $mainDir/Insula.fsf
	
		
	sed -e s%SUBJECT%"${newfile}"%g -e s%FILE%"${files}"%g -e s%OUTPUT%"${outp}"%g -e s%VOL%"${vol}"%g $mainDir/Insula.fsf > $mainDir/RInsula_temp_${newfile}_${outp}.fsf
						
	
	qsub -l h_cpu=1:00:00,h_rss=4G -o LI_job_${newfile}.txt -e LI_err_${newfile}.txt /usr/local/apps/psycapps/fsl/fsl-latest/bin/feat $mainDir/RInsula_temp_${newfile}_${outp}.fsf

echo 'Done'

done < $mainDir/list1.txt


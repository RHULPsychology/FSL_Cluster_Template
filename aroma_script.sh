#!/bin/bash


# Script to take list of subject names and performs 
# first level processing on Target Task files

feat_folder=$1;	
source /usr/local/apps/psycapps/config/conda_bash_update

python /usr/local/apps/psycapps/fsl_utils/ica-aroma/ica-aroma-0.3/ICA_AROMA.py -feat $feat_folder -dim 100 -out $feat_folder'/ICA-AROMA'

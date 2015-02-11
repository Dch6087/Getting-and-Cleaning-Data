# Getting-and-Cleaning-Data
Getting and Cleaning Data course project
--------------------------------------------------------------------------
Object : construction of tidy data set from raw data
--------------------------------------------------------------------------
Author : D Chevalier on 11/02/2015
--------------------------------------------------------------------------

4 documents are available :
- This "Read me" document : explanation of the script and the data
- a R script "run_analysis" : script transforming the raw data to tidy data and exporting it into a txt file
- a codebook "mean_data_set_codebook" : precise description of the script
- the final data "mean_data_set.txt" : a txt document with the tidy data

The raw data are extracted from  : Human Activity Recognition Using Smartphones Dataset
Version 1.0
Experiment description : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
raw data : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


the raw data are experiments results and their analysis threw 561 variables
the final data set is a data set with 
- 180 observations (exercice * subjects) on 69 variables

The final data are exported into a txt file ("mean_data_set.txt") in your working directory

Script main step (more details in the script)

1) Load several raw data
- parameters of the experiment (6 exercices, 30 subjects, 2 types of test)
- preanalyzed results (10299 experiments with 561 variables)
 
! The raw data must be stored in a "C_assignement" folder in your working directory!

2) merge data,select and rename variables into 1 working data set

3) agregate variable by subject and exercice 

4) export txt file

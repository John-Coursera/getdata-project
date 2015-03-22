# Getting and Cleaning Data Project #

This repo contains one script: `run_analysis.R`.  This script creates a tidy data set from the project data and outputs a file, `output.txt` containing means of observed data for each subject and activity type.

In particular, the script carries out the steps specified in the assignment:

> You should create one R script called run_analysis.R that does the following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In the script, these steps are performed in the order: 1, 4, 2, 3, 5.

To execute the script, download [the dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), expand the zip file, and place `run_analysis.R` and the extracted `UCI HAR Dataset` directory both in the same directory.  Ensure that the working directory is the directory containing `run_analysis.R` when it is run.  The output file will be written to this directory.

See CodeBook.md in this repository for more detail about the variables, data, and transformations performed.

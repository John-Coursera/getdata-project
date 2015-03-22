# Getting and Cleaning Data Project Codebook #

The code here takes the UCI HAR dataset and outputs the averages of the mean and standard deviation measurements, grouped by subject and activity type.  See `README.md` in this repository for information on how to execute the script.

## Input data ##

The data used in the UCI HAR dataset are test (`subject_test.txt`, `X_test.txt`, `y_test.txt`) and train (`subject_train.txt`, `X_train.txt`, and `y_test.txt`) sets of files.  The `subject` files contain the subject identifiers (a number), the `X` files contain the measured data (column names are given in `features_info.txt`), and the `y` files contain an identifier of the activity being performed (which can be related to activity names by `activity_labels.txt`).

For each set of files, the row numbers correspond to one observation.  For example, the first row of the three `train` files are one observation: `subject_train.txt` contains the subject's identifier, `y_train.txt` contains the activity id, and `X_train.txt` contains the measurement data for this observation.  The same applies to all rows of the `train` file set, and likewise for the `test` file set.

## Final output ##

The final output contains a summary of the data.  For each unique pair of subject id and activity name, the average of all measurements for this pair are given.  Only the "mean" and "std" (standard deviation) types of measurements are present in the final summary.

The column names of the output data are:

	 [1] "subject"                    
	 [2] "activity.name"              
	 [3] "activity.id"                
	 [4] "tBodyAcc-mean()-X"          
	 [5] "tBodyAcc-mean()-Y"          
	 [6] "tBodyAcc-mean()-Z"          
	 [7] "tGravityAcc-mean()-X"       
	 [8] "tGravityAcc-mean()-Y"       
	 [9] "tGravityAcc-mean()-Z"       
	[10] "tBodyAccJerk-mean()-X"      
	[11] "tBodyAccJerk-mean()-Y"      
	[12] "tBodyAccJerk-mean()-Z"      
	[13] "tBodyGyro-mean()-X"         
	[14] "tBodyGyro-mean()-Y"         
	[15] "tBodyGyro-mean()-Z"         
	[16] "tBodyGyroJerk-mean()-X"     
	[17] "tBodyGyroJerk-mean()-Y"     
	[18] "tBodyGyroJerk-mean()-Z"     
	[19] "tBodyAccMag-mean()"         
	[20] "tGravityAccMag-mean()"      
	[21] "tBodyAccJerkMag-mean()"     
	[22] "tBodyGyroMag-mean()"        
	[23] "tBodyGyroJerkMag-mean()"    
	[24] "fBodyAcc-mean()-X"          
	[25] "fBodyAcc-mean()-Y"          
	[26] "fBodyAcc-mean()-Z"          
	[27] "fBodyAccJerk-mean()-X"      
	[28] "fBodyAccJerk-mean()-Y"      
	[29] "fBodyAccJerk-mean()-Z"      
	[30] "fBodyGyro-mean()-X"         
	[31] "fBodyGyro-mean()-Y"         
	[32] "fBodyGyro-mean()-Z"         
	[33] "fBodyAccMag-mean()"         
	[34] "fBodyBodyAccJerkMag-mean()" 
	[35] "fBodyBodyGyroMag-mean()"    
	[36] "fBodyBodyGyroJerkMag-mean()"
	[37] "tBodyAcc-std()-X"           
	[38] "tBodyAcc-std()-Y"           
	[39] "tBodyAcc-std()-Z"           
	[40] "tGravityAcc-std()-X"        
	[41] "tGravityAcc-std()-Y"        
	[42] "tGravityAcc-std()-Z"        
	[43] "tBodyAccJerk-std()-X"       
	[44] "tBodyAccJerk-std()-Y"       
	[45] "tBodyAccJerk-std()-Z"       
	[46] "tBodyGyro-std()-X"          
	[47] "tBodyGyro-std()-Y"          
	[48] "tBodyGyro-std()-Z"          
	[49] "tBodyGyroJerk-std()-X"      
	[50] "tBodyGyroJerk-std()-Y"      
	[51] "tBodyGyroJerk-std()-Z"      
	[52] "tBodyAccMag-std()"          
	[53] "tGravityAccMag-std()"       
	[54] "tBodyAccJerkMag-std()"      
	[55] "tBodyGyroMag-std()"         
	[56] "tBodyGyroJerkMag-std()"     
	[57] "fBodyAcc-std()-X"           
	[58] "fBodyAcc-std()-Y"           
	[59] "fBodyAcc-std()-Z"           
	[60] "fBodyAccJerk-std()-X"       
	[61] "fBodyAccJerk-std()-Y"       
	[62] "fBodyAccJerk-std()-Z"       
	[63] "fBodyGyro-std()-X"          
	[64] "fBodyGyro-std()-Y"          
	[65] "fBodyGyro-std()-Z"          
	[66] "fBodyAccMag-std()"          
	[67] "fBodyBodyAccJerkMag-std()"  
	[68] "fBodyBodyGyroMag-std()"     
	[69] "fBodyBodyGyroJerkMag-std()" 

Where subject is the subject id, activity.name and activity.id are the name and id of the activity performed, and the remaining columns contain averages for this measurement for this subject and activity.

## Transformations ##

To transform the input data into this format, the following steps are taken.  See the code, `run_analysis.R` for implementation details.

1. The three files for each set are merged into a single data set, then the test and train sets are combined to create one data set containing all of the `subject`, `X`, and `y` data for the `test` and `train` sets.
2. The activity names are read from `features.txt` and added as column names of the measurement data.  The subject and activity id columns are manually named.
3. The measurement data is filtered to retain only the mean and standard deviation measurement types.
4. The activity names are added to the data set, using the lookup values in `activity_labels.txt`.
5. The data is grouped by subject and activity name, and the averages of the measurements for each grouped pair are calculated.  This gives the final data set which is written to `output.txt`.

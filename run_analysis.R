# This is for the coursera "Getting and Cleaning Data" (getdata-012) course

# The data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


# Instructions:

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

############# 1. Merges the training and the test sets to create one data set.

subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x.test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
y.test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)

data.test <- cbind(subject.test, y.test, x.test)

subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
x.train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
y.train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

data.train <- cbind(subject.train, y.train, x.train)

data.all <- rbind(data.test, data.train)

############# 4. Appropriately labels the data set with descriptive variable names.

x.names <- read.table("UCI HAR Dataset/features.txt", header=FALSE)$V2

col.names <- c(c("subject", "activity.id"), as.vector(x.names))

names(data.all) <- col.names


############# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# get column names of x-vars containing mean() or std()
x.names.mean <- as.vector(x.names[grep("mean()", x.names, fixed=TRUE)])
x.names.std <- as.vector(x.names[grep("std()", x.names, fixed=TRUE)])
stats.names <- c("subject", "activity.id", x.names.mean, x.names.std)
data.stats <- subset(data.all, select=stats.names)


############# 3. Uses descriptive activity names to name the activities in the data set

activity.names <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
names(activity.names) <- c("activity.id", "activity.name")
data.stats <- merge(data.stats, activity.names, by.x="activity.id", by.y="activity.id")


############# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

# calculate means by subject and activity.name
data.grouped.means <- data.stats %>% group_by(subject, activity.name) %>% summarise_each(funs(mean))

# final output
write.table(data.grouped.means, "output.txt", row.name=FALSE)

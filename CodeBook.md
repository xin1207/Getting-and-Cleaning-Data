# Original data set

Download the data [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

A full description of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

# R Script

The script `run_analysis.R`
- merges the training and test sets to create one data set
- replaces `activity` values in the dataset with descriptive activity names
- extracts only the measurements (features) on the mean and standard deviation
  for each measurement
- uses descriptive activity names to name the activities in the data set
- creates a second, independent tidy dataset with an average of each variable
  for each each activity and each subject. 

# Data Set

The original data set included the following files: 

1. test/subject_test.txt
2. test/X_test.txt
3. test/y_test.txt
4. train/subject_train.txt
5. train/X_train.txt
6. train/y_train.txt
7. activity_labels.txt
8. features.txt
9. features_info.txt
10. README.txt

# Variables

1. test.x : X_test.txt data frame
2. test.y : Y_test.txt data frame
3. test.subject : subject_test.txt data frame
4. trianing.x : X_train data.txt frame
5. training.y : Y_train data.txt frame
6. training.subject : subject_train.txt data frame
7. activity_labels	: activity_labels.txt data frame
8. features	: features.txt data frame
9. merged.x , merged.y , merged.subject : merged (X_test,X_train) , (Y_test,Y_train) , (subject_test,subject_train) data frames
10.tidy : final required tidy data set containing 180 observations

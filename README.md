# Getting and Cleaning Data Assignment

This repository contains a R script that cleans the data and a csv file of the tidied data set. 

Download the data [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

A full description of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## R Script

The script `run_analysis.R`
- merges the training and test sets to create one data set
- replaces `activity` values in the dataset with descriptive activity names
- extracts only the measurements (features) on the mean and standard deviation
  for each measurement
- uses descriptive activity names to name the activities in the data set
- creates a second, independent tidy dataset with an average of each variable
  for each each activity and each subject. 

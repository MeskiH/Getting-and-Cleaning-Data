# Cookbook for tidy_data.txt

This cookbook provides additional information about the variables and summaries calculated in the tidy_data.txt file.

## Description of the DATA
##  Dataset Information

## Variables

| Variable | Description | Units |
|---|---|---|
| subject | The subject ID | None |
| Activity_Label | The activity label | None |
| variable | The feature name | Varies |
| mean | The mean of the variable | Varies |


Variable name	Variable label	Variable type	Valid values	Missing values	Notes
subject	Subject ID	Numeric	1 to 30	None	
Activity_Label	Activity label	Categorical	laying, sitting, standing, walking, running	None	
tbodyacc.mean.x	Mean acceleration in the x-axis	Numeric	Any real number	-1000 to 1000	Units: m/s^2
tbodyacc.mean.y	Mean acceleration in the y-axis	Numeric	Any real number	-1000 to 1000	Units: m/s^2
tbodyacc.mean.z	Mean acceleration in the z-axis	Numeric	Any real number	-1000 to 1000	Units: m/s^2

## Download the data

activity_labels <- read.table(".\UCI HAR Dataset\activity_labels.txt")[,2]
features <- read.table(".\UCI HAR Dataset\features.txt")[,2]
extract_features <- grepl("mean|std", features)
X_test <- read.table(".\UCI HAR Dataset\test\X_test.txt")
y_test <- read.table(".\UCI HAR Dataset\test\y_test.txt")
subject_test <- read.table(".\UCI HAR Dataset\test\subject_test.txt")



## Files in folder ‘UCI HAR Dataset’:
SUBJECT FILES

test/subject_test.txt
train/subject_train.txt

ACTIVITY FILES

test/X_test.txt
train/X_train.txt

DATA FILES

test/y_test.txt
train/y_train.txt
features.txt 
activity_labels.txt

## Load required packages


if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

## Summaries

The mean is calculated for each variable for each subject and activity.

## Other relevant information

The tidy_data.txt file contains the tidied data frame from the UCI HAR Dataset. 
The data frame contains the mean and standard deviation of each feature for each subject and activity. 
This data can be used to train machine learning models to predict the activity of a subject based on their sensor data.









  
  
  
  
  
  
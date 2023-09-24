# Getting-and-Cleaning-Data

 ## This repository contains four files:
 
1. README.md - The document that explains the analysis files .

2. TidyDataSet.txt - A tidy data set that includes the mean for each variable for each activity and subject pair.


3. CODEBOOK.md - Summarizes the variables and data in TidyDataSet.txt, including identifiers, measurements, and activity    labels.                                                                                                                       

4 run_analysis.R - R script that does the following:

#Load and process the UCI HAR Dataset, extracts the mean and standard deviation features,
#and then merges the test and train data into a single data frame. Next, the data frame and 
#then applies the mean function to each variable using the dcast function. 
#Finally, the code writes the tidied data frame to a file called tidy_data.txt.
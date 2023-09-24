#The steps : 
#Load and process the UCI HAR Dataset, extracts the mean and standard deviation features,
#and then merges the test and train data into a single data frame. Next, the data frame and 
#then applies the mean function to each variable using the dcast function. 
#Finally, the code writes the tidied data frame to a file called tidy_data.txt.
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

#  activity labels
Activity_labels <- read.table(".\UCI HAR Dataset\activity_labels")[,2]

# data column names
features <- read.table(".\UCI HAR Dataset\features.txt")[,2]

# Extract the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

#  X_test & y_test data.
X_test <- read.table(".\UCI HAR Dataset\test\X_test.txt")
y_test <- read.table(".\UCI HAR Dataset\test\y_test.txt")
subject_test <- read.table(".\UCI HAR Dataset\test\subject_test.txt")

names(X_test) = features

# Extract the mean and standard deviation for each measurement.
X_test = X_test[,extract_features]

# activity labels
y_test[,2] = Activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_labels")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# X_train & y_train data.
X_train <- read.table(".\UCI HAR Dataset\train\X_train.txt")
y_train <- read.table(".\UCI HAR Dataset\train\y_train.txt")

subject_train <- read.table(".\UCI HAR Dataset\train\subject_train.txt")

names(X_train) = features

# Extract  the mean and standard deviation for each measurement.
X_train = X_train[,extract_features]

#  activity data
y_train[,2] = Activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

# dcast function
tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = ".\tidy_data.txt")

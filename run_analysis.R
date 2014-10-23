library(data.table)
library(plyr)


#Read the files 
tivity_labels <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/features.txt")[,2]
X_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")


# Extract only the measurements on the mean and standard deviation for each measurement.
names(X_test) = features
mean_sd_features <- grepl("mean|std", features)
X_test = X_test[,mean_sd_features]

# Load activity labels
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Merge the training and the test sets to create one data set.
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
data = rbind(test_data, train_data)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(tidy_data, file = "getdata-projectfiles-UCI HAR Dataset/tidy_data.txt")
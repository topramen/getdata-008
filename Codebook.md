run_analysis.R
==============

The purpose of this R file is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

**Data**
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
This contains data collected from the accelerometers from the Samsung Galaxy S smartphone. The data is contained in the following files:
*features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
*  'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Steps**
The code in run_analysis.R is clearly demarked into five sections, as stated below:
* Read the data files. The variable names have the same names as the files that the data originate from.
* Extract only the measurements on the mean and standard deviation for each measurement, because that is the data we are focussing on.
* Load activity labels, Uses descriptive activity names to name the activities in the data set, and appropriately labels the data set with descriptive variable names. 
* Merge the training and the test sets to create one data set.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


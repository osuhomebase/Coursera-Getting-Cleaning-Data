## Coursera-Getting-Cleaning-Data

The contained R scriped named run_analysis.R does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Dependencies

**run_analysis.R** depends on ```reshape2``` and ```data.table```
If these libraries are not already installed, run the following:
```
install.packages("data.table")
install.packages("reshape2")
```
## Steps to run this script

1. All data has been downloaded and stored in the github repo.  The original data was obtained here: [FUCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Clone this repo to your workstation
3. Set your working directory using the `setwd()` command
3. Run `source("run_analysis.R")` in your working directory.  
4. Enjoy the results: `tiny_data.txt`


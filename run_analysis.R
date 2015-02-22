

#get required packages
require("data.table")
require("reshape2")

####################################################
## Load all data
####################################################

## read column names into data frame
column_names <- read.table("./features.txt")
## get rid of the first column so we have just the column names
column_names <- column_names[,2]

## read activity labels into data frame
activity_labels <- read.table("./activity_labels.txt")
## get rid of first column of indexes 
activity_labels <- activity_labels[,2]
## read X_test into data frame
X_test <- read.table("./test/X_test.txt")
## add header columns to X_test
names(X_test) = column_names
## read Y_test into data frame
y_test <- read.table("./test/y_test.txt")
## read X_train into data frame
X_train <- read.table("./train/X_train.txt")
## add header columns to X_train
names(X_train) = column_names
## read y_train into data frame
y_train <- read.table("./train/y_train.txt")
## read subject_test into data frame
subject_test <- read.table("./test/subject_test.txt")
## read subject_train into data frame
subject_train <- read.table("./train/subject_train.txt")




####################################################
## Clean data
####################################################

## limit results to only mean/standard deviation

## create a boolean vector that indicates which column names contain the words "mean" or "std"
limiting_vector <- grepl("mean|std", column_names)

####################################################
## Test data
####################################################
## Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,limiting_vector]
## Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
## add headers to y_test
names(y_test) = c("Activity_ID", "Activity_Label")
## add header to subject train
names(subject_test) = "subject"
## Bind all test data
testing_data <- cbind(as.data.table(subject_test), y_test, X_test)


####################################################
## Train data
####################################################
## Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,limiting_vector]
## Load activity data
y_train[,2] = activity_labels[y_train[,1]]
## add headers to y_train
names(y_train) = c("Activity_ID", "Activity_Label")
## add header to subject train
names(subject_train) = "subject"
## Bind all training 
training_data <- cbind(as.data.table(subject_train), y_train, X_train)


####################################################
## Merge data
####################################################
## Merge test and training data
combined_data = rbind(testing_data, training_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

## Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt",row.name=FALSE )
##Course Project Code Book

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Source of the original data: [FUCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The contained R scriped named run_analysis.R does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Approach
This project requires the libraries data.table and [reshape2](http://cran.r-project.org/web/packages/reshape2/index.html).

Everything is performed in 3 main steps:
* Load all data - The code in this section does the following:
  * Loads all data from files
  * Adds header rows to data frames with column names from the features.txt file
* Clean all data - The code in this section does the following:
  * Extracts only the measurements on the mean and standard deviation for each statement.  This is done by removing all other irrelevant columns.
  * Builds the X and Y for test and training datasets and adds appropriate column names
  * Binds X and Y for both test and training data
* Merge all data - The code in this section does the following:
  * Merges testing and training data
  * Adds header columns to the merged data set
  * Double check to get rid of irrelevant columns
  * Figures out the mean and stores in an output friendly ***tidy*** dataset
* Export all data - This section simply saves to the tidy_data.txt file

## Data
The following files are used in this data set: 
* 'README.txt' (Not imported)
* 'features_info.txt': Shows information about the variables used on the feature vector. (Not imported)
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## Variables
Each imported data set has a variable with a name that matches the filename, except features, which I renamed coumn_names.  I only did this because I got confused later on in the code as to what the heck the features variable actually was.
* combined_data - merged data from testing and training data
* headers - vector of labels to be used in the final output
* data_labels - prune data to remove all irrelevant columns
* melt_data - reformat of data, stacking columns with matching names
* output_data - reformat into a format that is conducive to executing the mean function, then figure out the mean of everything


---
title: "GetData Course Project README"
author: "Henri Eskelinen"
date: "22 June 2015"
output: html_document
---

##Source of the raw data
The raw data contains accelerometer and gyroscope measurements taken using a 
Samsung Galaxy SII smartphone. The measurements were taken by 30 subjects performing six activities: lying down, sitting, standing, walking, walking downhill and walking uphill. The accelerometer measured the triaxial linear acceleration of the subject and the gyroscope took measurements for triaxial angular velocity. The measurements were processed into body motion and gravitational motion components and values such as the mean, standard deviation and kurtosis were then calculated for each activity and subject. 

##Instructions for generating the tidy data set
1. Download raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the data so that the 'UCI HAR Dataset' folder and its full contents are in your working directory
3. Run run_analysis.R script, which you will find in this repo

##Data Cleaning Process
1. Load training and test data sets: The data is split into two sets, called the training set and the testing set. These data sets are process independently before they are joined. Raw measurement for the training set are read from the X_train.txt, y_train.txt and subject_train.txt files. Accordingly, measurements for the test set are read from the X_test.txt, y_test.txt and subject_test.txt files.

3. Variable names: We use values from features.txt to apply descriptive variable names to each of the 561 variables (columns) in both the training and testing data sets. We also apply the names Activity and Subject for clarity.

3. Subset the desired variables: For the tidy data set, we only care about the assorted "mean" and "std" variables. We find the relevant variables by searching for variables names containing either the string "mean" or "std". For both the train and test datasets, we subset the data to only contain these variables.

4. We combine the two sets of data to create one complete data set.

5. We replace the values of the Activity variable with meaningful names for the activity being performed, which we obtain from activity_labels.txt.

6. Generate data set of average values: For each subject and activity, we calculate the average value of each variable (collumn). We use the 'dplyr' package to group the data set by subject and activity and use the summarize-function to create a tidy data set of the average values for each variable.

7. Write the tidy data to a file: We write the data obtained in the previous step into the "ActivityData.txt" file.

proj-tidy-submit
================

This repo is created as part of project submission for the clean and tidy data set.

The Data for the project is got from location :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
This was down loaded on date : 2014-07-23

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The end result was to have a tidy and clean data set with the following rules :
1. There are 2 sets of data sets "X_Train" and "X_Test" those are to be merged into a big data set.
2. There are different files those carry different subjects and the activity, we need to merge them.
3. After the merge there are so many rows and columns (10299 * 564 )
4. created a data set should just have the mean and standard deviation columns in it.
5. The final submission shall have the average of each variable for each avtivity and for each Subject.

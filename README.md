Course Project : Getting and Cleaning Data 
===========================================================================================================================

Introduction
------------
Repository contains Coursera project course part of "Getting and Cleaning data".

About the raw data
------------------

For test data -

The features can be found in the x_test.txt. 
The activity labels are in the y_test.txt.
The test subjects are in the subject_test.txt.

For training data -

The features can be found in the x_train.txt. 
The activity labels are in the y_train.txt.
The test subjects are in the subject_train.txt.

activity_labels.txt
features.txt


About the script and the tidy dataset
-------------------------------------
The script is called run_analysis.R which merge both test and training data sets together.

Labels are added and columns that have to do with mean and standard deviation are kept.

Finally, the script creates a tidy data set containing the means of all the columns.


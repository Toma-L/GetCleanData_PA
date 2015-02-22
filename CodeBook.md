#CODE BOOK for run_analysis.R

##Variables:

Subject: The index of each of these 30 people willing to take this experiment. (extracted from "subject train" and "subject test"" files)

Set: The index of each of 6 activities they did in the experiment. (extracted from train and test files)

Set: The index indicate training sets and testing sets.

other var: Names of features. (extracted from features file)

##Data: 

The data we use are collected from the accelerometers from the Samsung Galaxy S smartphone. And was downloaded from UCI. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##About my code:

The concept of my code follows the steps below:

1. Prepare the data we need.
2. Merges the training and the test sets.
3. Extracts only the measurements on the mean and standard deviation.
4. Uses descriptive activity names to name the activities in the data set.
5. Labels the data set with descriptive variable names.
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7. Make a csv file store my tidy data.

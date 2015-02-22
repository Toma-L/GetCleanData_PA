## Prepare the data we need.

features <- read.table("features.txt", colClasses = "character")

xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt", col.names = "Activity")
subtrain <- read.table("train/subject_train.txt", col.names = "Subject")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt", col.names = "Activity")
subtest <- read.table("test/subject_test.txt", col.names = "Subject")

## Merges the training and the test sets to create one data set.

train <- cbind(subtrain, Set = "Train", ytrain, xtrain)
test <- cbind(subtest, Set = "Test", ytest, xtest)

Merge <- rbind(train, test)

library(dplyr)
Merge <- arrange(Merge, Set, Subject, Activity)

## Extracts only the measurements on the mean and standard deviation for each measurement.

meanIndex <- grep("mean", features[, 2]) + 3
stdIndex <- grep("std", features[, 2]) + 3
allIndex <- sort(c(meanIndex, stdIndex))

Extract <- Merge[c(1, 2, 3, allIndex)]

## Uses descriptive activity names to name the activities in the data set.

actLabel <- read.table("activity_labels.txt")
actTimes <- as.data.frame(table(Extract$Activity))[, 2]

Extract <- arrange(Extract, Activity)
newAct <- rep(actLabel[, 2], actTimes)

Extract$Activity <- newAct

Extract <- arrange(Extract, Set, Subject, Activity)

## Appropriately labels the data set with descriptive variable names.

names(Extract) <- c("Subject", "Set", "Activity", features[allIndex - 3, 2])

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

by <- group_by(Extract, Subject, Activity)

tidyData <- summarise_each(by, funs(mean))

## Make a csv file store my tidy data

write.table(tidyData, "tidydata.txt", row.names = FALSE)
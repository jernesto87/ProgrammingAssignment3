require(plyr)

features = read.table("./prog-assignment-3/features.txt")
activity = read.table("./prog-assignment-3/activity_labels.txt")
features_vector = features[,2]
mean_std_cols = grep("-mean|-std",features_vector)

#2 - Extracting only mean and std related columns
test_X = read.table("./prog-assignment-3/test/X_test.txt")[mean_std_cols]
test_y = read.table("./prog-assignment-3/test/y_test.txt")
test_subject = read.table("./prog-assignment-3/test/subject_test.txt")
train_X = read.table("./prog-assignment-3/train/X_train.txt")[mean_std_cols]
train_y = read.table("./prog-assignment-3/train/y_train.txt")
train_subject = read.table("./prog-assignment-3/train/subject_train.txt")
test <- cbind(test_y, test_X, test_subject)
train <- cbind(train_y, train_X, train_subject)

#1 - Merging test and train datasets
full_dataset <- rbind(test, train)

#3 - Using descriptive activity names
full_dataset$V1 <- factor(full_dataset$V1, levels = activity[,1], labels = activity[,2])

#4 - Updating variable names on the dataset
features_names <- features[mean_std_cols,][,2]
features_names <- gsub("[()]", "", features_names)
features_names <- gsub("tBodyAcc", "Time Body Accelerometer ", features_names)
features_names <- gsub("tGravityAcc", "Time Gravity Accelerometer ", features_names)
features_names <- gsub("tBodyGyro", "Time Body Gyroscope ", features_names)
features_names <- gsub("fBodyAcc", "Frequency Body Accelerometer ", features_names)
features_names <- gsub("fGravityAcc", "Frequency Gravity Accelerometer ", features_names)
features_names <- gsub("fBodyGyro", "Frequency Body Gyroscope ", features_names)
features_names <- gsub("fBodyBodyAcc", "Frequency Body Body Accelerometer ", features_names)
features_names <- gsub("fBodyBodyGyro", "Frequency Body Body Gyroscope ", features_names)
features_names <- gsub("Mag", "Magnitude", features_names)
features_names <- gsub("mean", "Mean", features_names)
features_names <- gsub("std", "Deviation", features_names)
features_names <- gsub("MeanFreq", "Mean Frequency", features_names)
features_names <- gsub("[ -]", "-", features_names)
features_names <- gsub("JerkMagnitude", "Jerk Magnitude", features_names)
features_names <- c("Activities", features_names, "Subjects")

colnames(full_dataset) <- features_names

#5 - Creating independent dataset with the average of each variable for each activity and subject
tidy_avg = ddply(full_dataset, c("Subjects","Activities"), numcolwise(mean))

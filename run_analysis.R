# Peer-graded Assignment: Getting and Cleaning Data Course Project

# 1. Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

tidy <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set.

tidy$code <- activities[tidy$code, 2]

# 4. Appropriately labels the data set with descriptive variable names.

names(tidy)[2] = "activity"
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("Mag", "Magnitude", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("tBody", "TimeBody", names(tidy))
names(tidy)<-gsub("-mean()", "Mean", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-std()", "STD", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-freq()", "Frequency", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("angle", "Angle", names(tidy))
names(tidy)<-gsub("gravity", "Gravity", names(tidy))





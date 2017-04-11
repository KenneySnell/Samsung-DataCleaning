# Part 1 Merge Traing and Test sets
# Get Features (561) vartiables

setwd("C:\\Users\\app1kms\\Documents\\Training\\2017\\DataScience_Downloads\\Data_Cleaning\\UCI HAR Dataset")

features <- read.table("features.txt")

# Work on naming and merging train datasets


activitylabels <- read.table("activity_labels.txt")

setwd("C:\\Users\\app1kms\\Documents\\Training\\2017\\DataScience_Downloads\\Data_Cleaning\\UCI HAR Dataset\\train")

# read subject_train.txt - Who performed the activity (1-30)

train_subjects <- read.table("subject_train.txt")

# add subject to data frame train_subjects

colnames(train_subjects) <- c( 'Subjects')


# read X-train.txt - training set (561 feature vectors with time and frequency)

train_feature_vector <- read.table("X_train.txt")


# read y-train.txt - Training Labesl Activity (1-6)

train_activity <- read.table("y_train.txt")


colnames(train_activity) <- c( 'Activity')


# combind Subject, activity, vector

Train_df <- cbind(train_subjects,train_activity,train_feature_vector)






# Work on naming and merging Test datasets

setwd("C:\\Users\\app1kms\\Documents\\Training\\2017\\DataScience_Downloads\\Data_Cleaning\\UCI HAR Dataset\\test")

# read subject_test.txt - Who performed the activity (1-30)

test_subjects <- read.table("subject_test.txt")

# add subject to data frame train_subjects

colnames(test_subjects) <- c( 'Subjects')


# read X-train.txt - training set (561 feature vectors with time and frequency)

test_feature_vector <- read.table("X_test.txt")


# read y-test.txt - Training Labesl Activity (1-6)

test_activity <- read.table("y_test.txt")


colnames(test_activity) <- c( 'Activity')


# combind Subject, activity, vector

Test_df <- cbind(test_subjects,test_activity,test_feature_vector)

merge_train_test <- rbind(Train_df,Test_df)


# Name all the columns
# get variables]

# Added number to make unique column names
x <- paste(1:561,dput(as.character(features[[2]])))

y <- c("Subjects" , "Activity")
z <- c(y,x)


names(merge_train_test) <- z

#write out data frame
setwd("C:\\Users\\app1kms\\Documents\\Training\\2017\\DataScience_Downloads\\Data_Cleaning\\UCI HAR Dataset")

write.table(merge_train_test, "merge_train_test.txt")





# Part 2

# Extract only the meansurementa that have mean and STD in their column names.

library("dplyr")
library("data.table")

# work with Data table for speed.

test_train_table <- tbl_df(merge_train_test) 
mean_std_measurement <- select(merge_train_test, Subjects,Activity,contains("mean"),contains("std") ) 




# Part 3 Uses descriptive activity names to name the activities in the data set


mean_std_measurement$Activity <- as.character(mean_std_measurement$Activity)
for (i in 1:6){
  mean_std_measurement$Activity[mean_std_measurement$Activity == i] <- as.character(activitylabels[i,2])
}


# part 4 Appropriately labels the data set with descriptive variable names using gsub

names( mean_std_measurement)<-gsub("Acc", "Accelerometer", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("Gyro", "Gyroscope", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("BodyBody", "Body", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("Mag", "Magnitude", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("^t", "Time", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("^f", "Frequency", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("tBody", "TimeBody", names( mean_std_measurement))
names( mean_std_measurement)<-gsub("-mean()", "Mean", names( mean_std_measurement), ignore.case = TRUE)
names( mean_std_measurement)<-gsub("-std()", "STD", names( mean_std_measurement), ignore.case = TRUE)
names( mean_std_measurement)<-gsub("-freq()", "Frequency", names( mean_std_measurement), ignore.case = TRUE)
names( mean_std_measurement)<-gsub("angle", "Angle", names( mean_std_measurement))
names(mean_std_measurement)<-gsub("gravity", "Gravity", names(mean_std_measurement))


names(mean_std_measurement)

# Part 5 From the data set in step 4, creates a second, independent tidy data set (tidyData_Mean) with the average of each variable for each activity and each subject



mean_std_measurement$Subject <- as.factor(mean_std_measurement$Subject)


# e create tidyData as a data set with average for each activity and subject. Then, we order the enties in tidyData and write it into data file Tidy.txt that contains the processed data.
tidyData_Mean <- aggregate(. ~Subject + Activity, mean_std_measurement, mean)
tidyData_Mean <- tidyData_Mean[order(tidyData_Mean$Subject,tidyData_Mean$Activity),]
write.table(tidyData_Mean, file = "Tidy_Mean.txt", row.names = FALSE)




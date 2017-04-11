Variable assignments

features  = 561 variables that were corrected during the test

activitylabels = Activities performed by the subjects in the train and test (1-6)

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


TRAINING

train_subjects = Persons (no identified) who participated in the train  activities


train_feature_vector = Traininig large 561 vector csaptured during the Training exercise

train_activity  = Training activities performed.

Train_df = (data frame) all training activities inlcuding (Subject, Activity, and the data collected)

TESTING

test_subjects = Persons (no identified) who participated in the  testing activities


test_feature_vector = Testing large 561 vector csaptured during the Training exercise

test_activity  = Testing activities performed.

Test_df = (data frame) all Testing activities inlcuding (Subject, Activity, and the data collected)

merge_train_test  = merged Training and Testing Data Frames

merge_train_test.txt  - File containing the merge_train_test


test_train_table - Data table (faster) for faster processing of merge_train_test


mean_std_measurement  = captured only mean and standard deviation variables within the columne names.


tidyData_Mean - final data table that contained the subject, activity and traiing and testing measurements for averages by subject and activity

Tidy_Mean.txt  - final write text file.
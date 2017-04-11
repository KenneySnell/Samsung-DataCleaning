# Samsung-DataCleaning
Getting and Data Cleaning - Final assignment

Part 1. Read in all high level text files (Subjects, Activities, 561 large vector variables.  
 a. Then read in the data for training.
 b. Add in the Subjects and activites
 c. Use Colbind to combine the data.
 d. Then read in the data for testing.
 e. Add in the Subjects and activites
 f. Use Colbind to combine the data.
 g. Update all 563 column names (Subject, Activity, + 561 variables.  I also had to add in number (1:561) to the column names to make them unique.  Without doing this, I got duplicate names whn wokring with data tables.
 h. Combine both Training and Testing (merge_train_test - df) and wrote a file called merge_train_test.txt
 
 Part 2.
 Add data into a data table (test_train_table)
 create a new data table (mean_STD_measurements) that only caontained column names of "mean" and "sdt"
 
 Part 3.  
 Chaneg the activity number (1-6) to their names (1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Part 4 - Modify the Column names from  abbreviations to longer more descriptve names (tBodyAcc-mean()-X went toTimeBodyAccelerometerMean()-X
Part 5 
  a.  ASggregate the data table that find the average by subject and activity (tidyData_Mean).
  b. Write a file that takes the mean by Subject anb Activity (file - :Tidy_Mean.txt"
  b



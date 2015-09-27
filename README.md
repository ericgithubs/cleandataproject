##How the code works
###Part 1: Merges the training and the test sets to create one data set. 
###Part 4: Appropriately labels the data set with descriptive variable names. 
#####Both Part 1 and 4 will be addressed in this part
1. The code will first set working director to unzipped data forlder ".../UCI HAR Dataset"
2. It reads all txt files in test folder and store them in appropriate variables
3. It then combine all variables from step 2 by columns as "all_test"
4. It reads all txt files in train folder and store them in appropriate variables
3. It then combine all variables from step 4 by columns as "all_train"
4. combine data from "test" folder with data from "train" folder by "rbind" "all_test" and "all_train"
5. read features information from "features.txt" and store it in "features"
6. take 2nd column of "features" and covert it to a vector including all "feature_names"
7. generate column names for "all_data", each column has a unique name by setting "unique = TRUE" (Note: in this step, invalid character such as "(" and ")" will be converted to "."). The 128 readings for "body_acc_x", for example, will be named "body_acc_x", "body_acc_x1", etc.

###Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
The code uses the "select" function from the dplyr package to select the first two columns "Subject" and "Activity" as well as all columns that have the keywords "mean" or "std" in their names, and store them in a variable called "mean_stds"

###Part 3: Uses descriptive activity names to name the activities in the data set
1. read activity labels from "activity_label.txt" and extract the activity names (2nd column) that correspond to number 1-6, and store them in a vector "activity_name"
2. convert the integers 1-6 in the "Activity" column to factors with 6 levels
3. replace factors 1-6 in "Activity" column with descriptive factors stored in "activity_name"

###Part 4: Appropriately labels the data set with descriptive variable names. 
Note: Solved in Part 1, each column now already has a descriptive variable name

###Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. calculte the means of variables in columns 3-88 based on the groups of "Subject" and "Activity" using "aggregate" function and store them in "output" variable
2. export "output" to a txt file "output.txt"

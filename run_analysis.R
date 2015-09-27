<<<<<<< HEAD
#Part 1: 
#Merges the training and the test sets to create one data set. 
#Appropriately labels the data set with descriptive variable names. 

#first to set working director to unzipped data forlder ".../UCI HAR Dataset"

subject_test <- read.table("./test/subject_test.txt")
activity_test <- read.table("./test/y_test.txt")
features_test <- read.table("./test/x_test.txt")

body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt")

all_test<- cbind(subject_test,activity_test,features_test,
                 body_acc_x_test, body_acc_y_test, body_acc_z_test, 
                 body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, 
                 total_acc_x_test, total_acc_y_test, total_acc_z_test)


subject_train <- read.table("./train/subject_train.txt")
activity_train <- read.table("./train/y_train.txt")
features_train <- read.table("./train/x_train.txt")

body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt")

all_train<- cbind(subject_train, activity_train, features_train,
                  body_acc_x_train, body_acc_y_train, body_acc_z_train,
                  body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, 
                 total_acc_x_train, total_acc_y_train, total_acc_z_train)

#combine data from "test" folder with data from "train" folder
all_data <- rbind(all_test,all_train)
#read features information from "features.txt" and store it in "features"
features <- read.table("features.txt", sep = " ")
#take 2nd column of "features" and covert it to a vector including all "feature_names"
feature_names <- as.vector(features[,2])
#generate column names for "all_data", each column has a unique name by setting "unique = TRUE"
#invalid character such as "(" and ")" will be converted to "."
#the 128 readings for "body_acc_x", for example, will be named "body_acc_x", "body_acc_x1", etc.
datanames <- make.names(names = c("Subject", "Activity", feature_names, 
                                  rep("body_acc_x", 128), rep("body_acc_y",128), rep("body_acc_z",128), 
                                  rep("body_gyro_x",128), rep("body_gyro_y",128), rep("body_gyro_z",128), 
                                  rep("total_acc_x",128), rep("total_acc_y",128), rep("total_acc_z",128)), 
                        unique = TRUE)
names(all_data) <- datanames

#Part 2: 
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#use the "select" function from the dplyr package to select the first two columns "Subject" and "Activity" as well as 
#all columns that have the keywords "mean" or "std" in their names
library(dplyr)
means_stds <- select(all_data, Subject, Activity, matches("(mean|std)"))


#Part 3: 
#Uses descriptive activity names to name the activities in the data set
#read activity labels from "activity_label.txt" and extract the activity names (2nd column) 
#that correspond to number 1-6, and store them in a vector "activity_name"
activity_labels <- read.table("activity_labels.txt")
activity_name <- activity_labels$V2
#convert the integers 1-6 in the "Activity" column to factors with 6 levels
means_stds$Activity <- as.factor(means_stds$Activity)
#replace factors 1-6 in "Activity" column with descriptive factors stored in "activity_name"
levels(means_stds$Activity) <- activity_name

#Part 4: 
#Appropriately labels the data set with descriptive variable names. 
#Note: Solved in Part 1, each column now has a descriptive variable name

#Part 5: From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

#calculte the means of variables in columns 3-88 based on the groups of "Subject" and "Activity"
output <- aggregate(means_stds[,3:88], 
                    by = list(Subject = means_stds$Subject, Activity = means_stds$Activity), 
                    mean)
#export "output" to a txt file "output.txt"
write.table(output, file = "output.txt", row.names = FALSE)
=======
#Part 1: 
#Merges the training and the test sets to create one data set. 
#Appropriately labels the data set with descriptive variable names. 

#first to set working director to unzipped data forlder ".../UCI HAR Dataset"
#read feature.txt and generates a 561x2 data frame "features"

subject_test <- read.table("./test/subject_test.txt")
activity_test <- read.table("./test/y_test.txt")
features_test <- read.table("./test/x_test.txt")

body_acc_x_test <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./test/Inertial Signals/total_acc_z_test.txt")

all_test<- cbind(subject_test,activity_test,features_test,
                 body_acc_x_test, body_acc_y_test, body_acc_z_test, 
                 body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, 
                 total_acc_x_test, total_acc_y_test, total_acc_z_test)


subject_train <- read.table("./train/subject_train.txt")
activity_train <- read.table("./train/y_train.txt")
features_train <- read.table("./train/x_train.txt")

body_acc_x_train <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./train/Inertial Signals/total_acc_z_train.txt")

all_train<- cbind(subject_train, activity_train, features_train,
                  body_acc_x_train, body_acc_y_train, body_acc_z_train,
                  body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, 
                 total_acc_x_train, total_acc_y_train, total_acc_z_train)

#combine data from "test" folder with data from "train" folder
all_data <- rbind(all_test,all_train)
#read features information from "features.txt" and store it in "features"
features <- read.table("features.txt", sep = " ")
#take 2nd column of "features" and covert it to a vector including all "feature_names"
feature_names <- as.vector(features[,2])
#generate column names for "all_data", each column has a unique name by setting "unique = TRUE"
#invalid character such as "(" and ")" will be converted to "."
#the 128 readings for "body_acc_x", for example, will be named "body_acc_x", "body_acc_x", etc.
datanames <- make.names(names = c("Subject", "Activity", feature_names, 
                                  rep("body_acc_x", 128), rep("body_acc_y",128), rep("body_acc_z",128), 
                                  rep("body_gyro_x",128), rep("body_gyro_y",128), rep("body_gyro_z",128), 
                                  rep("total_acc_x",128), rep("total_acc_y",128), rep("total_acc_z",128)), 
                        unique = TRUE)
names(all_data) <- datanames

#Part 2: 
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#use the "select" function from the dplyr package to select the first two columns "Subject" and "Activity" as well as 
#all columns that have the keywords "mean" or "std" in their names
library(dplyr)
means_stds <- select(all_data, Subject, Activity, matches("(mean|std)"))


#Part 3: 
#Uses descriptive activity names to name the activities in the data set
#read activity labels from "activity_label.txt" and extract the activity names (2nd column) 
#that correspond to number 1-6, and store them in a vector "activity_name"
activity_labels <- read.table("activity_labels.txt")
activity_name <- activity_labels$V2
#convert the integers 1-6 in the "Activity" column to factors with 6 levels
means_stds$Activity <- as.factor(means_stds$Activity)
#replace factors 1-6 in "Activity" column with descriptive factors stored in "activity_name"
levels(means_stds$Activity) <- activity_name

#Part 4: 
#Appropriately labels the data set with descriptive variable names. 
#Note: Solved in Part 1, each column now has a descriptive variable name

#Part 5: From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

#calculte the means of variables in columns 3-88 based on the groups of "Subject" and "Activity"
output <- aggregate(means_stds[,3:88], 
                    by = list(Subject = means_stds$Subject, Activity = means_stds$Activity), 
                    mean)
#export "output" to a txt file "output.txt"
write.table(output, file = "output.txt", row.names = FALSE)
>>>>>>> d761b8fa88378d271cbb6866d3de3d308b1ff1d5

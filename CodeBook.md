#CodeBook

This is a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data for this course project.

##The data source

Original data was obtained from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


##Transformations performed to clean up the data

Objective of the tranformations is to

 1)  Merge the training and the test sets to create one data set

 2)  Extract the measurements on the mean and standard deviation for each measurement. 

 3)  Convert activity codes to descriptive activity names 

 4)  Label the data set with descriptive variable names. 

 5)  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

###Procedure:

Using 'run_analysis.R' load files :

	- features.txt

	- activity_labels.txt

	- train/X_train.txt

	- train/y_train.txt

	- train/subject_train.txt

	- test/X_test.txt

	- test/y_test.txt

	- test/subject_test.txt

into R-studio, each into separate data.frame object.

Transform activity codes (contained in files y_train.txt and y_test.txt) to descriptive names using function 'DescriptiveActivityName'. Descriptive names are contained in file 'activity_labels.txt'.

Append subject numbers (contained in files subject_train.txt and subject_test.txt) and activity names (tranformed in previous step) to data sets containing the observations (files X_train.txt and X_test.txt, this is done separately for test and training data).

Give names to the columns of the data set (this is done separately for test and training data).

Select only columns 'activity', 'subject' and columns containing measurements on the mean and standard deviation for each measurement (this is done separately for test and training data).

Append train data to test data.

Use dplyr package's 'group_by' and 'summarise_each' functions to create an independent tidy data set with the average of each variable for each activity and each subject.

Finally, write tidy data set to a file to current working directory.

###Variables and summaries calculated

Tidy data set contains average of the variable for each activity and each subject for the following variables:

fBodyAccJerk-mean()-X

fBodyAccJerk-mean()-Y

fBodyAccJerk-mean()-Z

fBodyAccJerk-std()-X

fBodyAccJerk-std()-Y

fBodyAccJerk-std()-Z

fBodyAccMag-mean()

fBodyAccMag-std()

fBodyAcc-mean()-X

fBodyAcc-mean()-Y

fBodyAcc-mean()-Z

fBodyAcc-std()-X

fBodyAcc-std()-Y

fBodyAcc-std()-Z

fBodyBodyAccJerkMag-mean()

fBodyBodyAccJerkMag-std()

fBodyBodyGyroJerkMag-mean()

fBodyBodyGyroJerkMag-std()

fBodyBodyGyroMag-mean()

fBodyBodyGyroMag-std()

fBodyGyro-mean()-X

fBodyGyro-mean()-Y

fBodyGyro-mean()-Z

fBodyGyro-std()-X

fBodyGyro-std()-Y

fBodyGyro-std()-Z

tBodyAccJerkMag-mean()

tBodyAccJerkMag-std()

tBodyAccJerk-mean()-X

tBodyAccJerk-mean()-Y

tBodyAccJerk-mean()-Z

tBodyAccJerk-std()-X

tBodyAccJerk-std()-Y

tBodyAccJerk-std()-Z

tBodyAccMag-mean()

tBodyAccMag-std()

tBodyAcc-mean()-X

tBodyAcc-mean()-Y

tBodyAcc-mean()-Z

tBodyAcc-std()-X

tBodyAcc-std()-Y

tBodyAcc-std()-Z

tBodyGyroJerkMag-mean()

tBodyGyroJerkMag-std()

tBodyGyroJerk-mean()-X

tBodyGyroJerk-mean()-Y

tBodyGyroJerk-mean()-Z

tBodyGyroJerk-std()-X

tBodyGyroJerk-std()-Y

tBodyGyroJerk-std()-Z

tBodyGyroMag-mean()

tBodyGyroMag-std()

tBodyGyro-mean()-X

tBodyGyro-mean()-Y

tBodyGyro-mean()-Z

tBodyGyro-std()-X

tBodyGyro-std()-Y

tBodyGyro-std()-Z

tGravityAccMag-mean()

tGravityAccMag-std()

tGravityAcc-mean()-X

tGravityAcc-mean()-Y

tGravityAcc-mean()-Z

tGravityAcc-std()-X

tGravityAcc-std()-Y

tGravityAcc-std()-Z



###Units

The measurements were normalized and bounded within range [-1,1] in the original data. 
Units are preserved in this transformation.

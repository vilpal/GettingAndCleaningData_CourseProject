

##Install & Load dplyr package 
##dplyr package is useful for summarizing the data to tidy data set
install.packages("dplyr")
library(dplyr)

##read activity labels file
activity_labels<-read.table("activity_labels.txt")

##read features-file (this contains column names of the dataset)
features<-read.table("features.txt")


##Define a helper function that converts activity code 1,2,3 to descriptive
##activity name
## PLEASE NOTE that the function utilizes activit_labels dataframe which is loaded above
DescriptiveActivityName<-function(ActivityId)
{
  ##return descriptive activity name for a given activityId
	returnValue<-as.character(activity_labels[activity_labels$V1==ActivityId,2])
	returnValue
}


##Read Test data
subject_test<-read.table("test/subject_test.txt")
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")


##Read Train data
subject_train<-read.table("train/subject_train.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")


##Change activity code to descriptive name
y_test<-sapply(y_test[,1],DescriptiveActivityName)
y_train<-sapply(y_train[,1],DescriptiveActivityName)

##Append subject numbers and activity names to data set containing the observations
x_test<-cbind(subject_test$V1,y_test,x_test)
x_train<-cbind(subject_train$V1,y_train,x_train)

##give names to the columns of the data set
names(x_test)<-c('subject','activity',as.vector(features$V2))
names(x_train)<-c('subject','activity',as.vector(features$V2))

##Find out which columns have
##measurements on the mean and standard deviation for each measurement 
##Use regular expression function grep to columns ending "-meanFreq()"
##These will be later removed from the set
MeansFreq<-grep("-meanFreq()", names(x_test))

##Use regular expression function grep to columns ending "-mean()" 
##This set includes also columns ending "-meanFreq()"
Means<-grep("-mean()", names(x_test))

##remove columns ending "-meanFreq()"
##what is left are the columns ending "-mean()" 
Means <- Means[which(!Means %in% MeansFreq)] 

##Use regular expression function grep to columns ending "-std()"
Std<-grep("-std()", names(x_test))

##Select only activity, subject and columns containing
##measurements on the mean and standard deviation for each measurement
Means_stds<-x_test[,c(1,2,Means,Std)]

##Append Train data to test data
Means_stds<-rbind(Means_stds,x_train[,c(1,2,Means,Std)])

##use dplyr packages group_by and summarise_each functions 
##to creates an independent tidy data set with the average of 
##each variable for each activity and each subject
tidyData<-Means_stds %>% group_by(activity,subject) %>% summarise_each(funs(mean))

##write tidy data set to file to current working directory
write.table(tidyData,row.name=FALSE, file="tidyData.txt") 


##The end

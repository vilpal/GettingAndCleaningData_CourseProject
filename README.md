# Getting and Cleaning Data Course Project

# Steps to reproduce the course work

1) download zip-file (
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) containing the raw data to a folder on your computer and uncompress the archive. After this there will be a folder called 'UCI HAR Dataset'.

2) copy 'run_analysis.R' into folder 'UCI HAR Dataset'.

3) open R-Studio and set working directory to folder 'UCI HAR Dataset' using setwd() function. 

4) run the script with command source('run_analysis.R') to perform the data transformation. As a result 'tidyData.txt' file will be generated to your working directory.

# Dependencies

run_analysis.R installs the package 'dplyr'.
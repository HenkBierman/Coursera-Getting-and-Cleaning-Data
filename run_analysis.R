## This script creates two tidy files based on a dataset of the
## Human Activity Recognition Using Smartphones Dataset Project:
## The script merges the test- and traindata and adds the activity
## description, and writes this into a txt file
## Secondly the above file is summarized bij calculating the
## mean of involved colums per subject-activity combination
## Both files are printed and written as txt files
  
  install.packages("reshape2", repos = "https://cran.cnr.Berkeley.edu/")
  install.packages("dplyr", repos = "https://cran.cnr.Berkeley.edu/")
  library(reshape2)
  library(dplyr)
  
  setwd("/users/ActuarieelAdvies/documents/CourseraGettingCleaningData/Assignment")

## Read activity names   
  
  activityNames <- read.table("Activity_labels.txt")
  
## Read feature names and determine offsets of the features with mean or std in its name
  
  featureNames <- read.table("features.txt")
  featureNamesLower <- tolower(featureNames$V2)
  selectFeaturesMean <- grep("mean", featureNamesLower)
  selectFeaturesStd <- grep("std", featureNamesLower)
  selectFeatures <- selectFeaturesMean
  selectFeatures <- sort(append(selectFeatures, selectFeaturesStd))
  
## Read test and training data
    
  testData <- read.table("X_test.txt", header = FALSE, sep = "")
  trainData <- read.table("X_train.txt", header = FALSE, sep = "")

## join test and train data into one dataframe and add appropriate heading  
    
  joinedTrainTestData <- rbind(trainData, testData, make.row.names = FALSE)
  joinedTrainTestDataMeanStd <- joinedTrainTestData[selectFeatures]
  
  names(joinedTrainTestDataMeanStd) <- featureNames[selectFeatures, 2]

## Read test and train lables, and join them in one dataframe and select mean and std

  testLabels <- read.table("y_test.txt", header = FALSE, sep = "")
  trainLabels <- read.table("y_train.txt", header = FALSE, sep = "")

  joinedLabels <- rbind(trainLabels, testLabels, make.row.names = FALSE)
  
## Assign activity names to the matching labels  
    
  names(activityNames) <- c("activity_id", "activity")
  
  names(joinedLabels) <- c("label_id")

  joinedLabels <- merge(joinedLabels, activityNames, by.x = "label_id", by.y = "activity_id", sort = FALSE)
 
## join test and train subjects and give it a proper header name
   
  testSubjects <- read.table("subject_test.txt", header = FALSE, sep = "")
  trainSubjects <- read.table("Subject_train.txt", header = FALSE, sep = "")
  
  joinedSubjects <- rbind(trainSubjects, testSubjects, make.row.names = FALSE)
  
  names(joinedSubjects) <- c("Subject_id")
  
## merge joinedTrainTestData with labels and remove row.names column
  
  joinedTrainTestDataMeanStd <- merge(joinedLabels, joinedTrainTestDataMeanStd, by = "row.names", sort = FALSE)
  joinedTrainTestDataMeanStd <- select(joinedTrainTestDataMeanStd, 2:length(joinedTrainTestDataMeanStd))

## add subjects to the dataframe and remove row.names column
## destillate the first tidy dataframe out of the collection dataframe and print head 
  
  joinedTrainTestDataMeanStd <- merge(joinedSubjects, joinedTrainTestDataMeanStd, by = "row.names", sort = FALSE)
  
  TidiedTrainTestData <- select(joinedTrainTestDataMeanStd, 2:ncol(joinedTrainTestDataMeanStd))
  head(TidiedTrainTestData)
  
## retrieve required attributes for the second tidy dataframe out of the collection dataframe  
  
  TidiedAvarageData <- select(TidiedTrainTestData, 1:2, 4:ncol(TidiedTrainTestData))
  
## create the agregated means data per subject and activity  
  
  summary <- aggregate(TidiedAvarageData, list(TidiedAvarageData$Subject_id, TidiedAvarageData$label_id), FUN = "mean")
  summary <- select(summary, 3:ncol(summary))
  
## Write the two created tidy dataframes to respective files  
    
  write.table(TidiedTrainTestData, "TidiedTrainTestData")
  write.table(summary, "TidiedAvarageData", row.name = FALSE)

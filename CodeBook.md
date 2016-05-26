Assignment of Coursera Getting And Cleaning Data Course

This Assignment is based on the Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

This script creates two tidy files based on a dataset of the Human Activity Recognition Using Smartphones Dataset Project:

The script adds the test- and traindata together in a single collection dataframe: joinedTrainTestData; 
From this dataframe the involved mean and Standard Deviation components were selected based on the Features.txt file;
This subset is kept in the data.frame joinedTrainTestMeanStd. 

Also the train and test labels are added together in a single dataframe.

Thus the "lable-id" and "activity_name" based on the activity_labels.txt file, are merged to above collection dataframe, 
based on matching labels with their respective train and testdata.

Also the train and test subjects are added together in a single dataframe; the subject_ids are merged to above collection dataframe

Thus the "subject-id" is merged to above collection dataframe, based on matching subjects with their respective train and testdata.

Appropriete header data is added to the dataframes.

Then the first tidy dataframe is derived from the collection dataframe: TidiedTrainTestData, 
containing all the mean and Std columns from together with subject_id, label_id and activity_name.

This dataframe is printed and written as TidiedTrainTestData.txt to the working directory.

Consequently a second tidied data frame is derived from the TidiedTrainTestData dataframe: TidiedAverageData containing: 
"subject_id", "activity_id", and the means of all the mean and Std columns

This summary result is saved as a dataframe (to obtain all output), printed and written as TidiedAverageData.txt to the working directory.

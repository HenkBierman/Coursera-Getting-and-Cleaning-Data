# Coursera-Getting-and-Cleaning-Data
Assignment of Coursera Getting And Cleaning Data Course

This script creates two tidy files based on a dataset of the Human Activity Recognition Using Smartphones Dataset Project:

The script adds the test- and traindata together in a single collection dataframe: joinedTrainTestData; Only the involved mean and Standard Deviation components were selected

Also the train and test labels are added together in a single dataframe.

Thus the "lable-id" and "activity_name" are merged to above collection dataframe, based on matching labels with their respective train and testdata.

Also the train and test subjects are added together in a single dataframe; the subject_ids are merged to above collection dataframe

Thus the "subject-id" is merged to above collection dataframe, based on matching subjects with their respective train and testdata.

Appropriete header data is added to the dataframes.

Then the first tidy dataframe is derived from the collection dataframe: TidiedTrainTestData, containing all the mean and Std columns from together with subject_id, label_id and activity_name.

This dataframe is printed and written as TidiedTrainTestData.txt to the working directory.

Consequently a second tidied data frame is derived from the TidiedTrainTestData dataframe: TidiedAverageData containing: "subject_id", "activity_id", and the means of all the mean and Std columns 

This summary result is saved as a dataframe (to obtain all output), printed and written as TidiedAverageData.txt to the working directory.

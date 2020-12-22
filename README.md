# Course assignment

This is for the week 4 assignment of the course "Getting and Cleaning Data" from the course series "Data Science: Foundations using R Specialization".

This course project include files:
1. CodeBook.md: explains the variables in the dataset in file tidy_data.txt
2. run_analysis.R: the R script for data cleaning and processing
3. tidy_data.txt: the data saved after data cleaning and processing

Please ignore the HelloWorld.md file since it was for another course assignment for the same course series.

What run_analysis.R does?
1. check working directory, if needed set it to the folder where you have the dataset that you want to work with
2. read data from the two folder: train and test, combine features and subject number and activity code together
3. merge training and testing data
4. rename the variables to use variable names that is easy to understand
5. delete duplicate column
6. extracts only the measurements on the mean and standard deviation for each measurement
7. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. save it in file tidy_data.txt

Thank you for reviewing my assignment!


# loading packages
library(dplyr)

# directory
getwd()
list.files()
# set if needed
# setwd(getwd()) or setwd("D:\\R_files\\GettingandCleaningDataProject")

list.dirs("./data")
list.files("./data/dataset")
list.files("./data/dataset/train")
list.files("./data/dataset/test")

# reading files
features <- read.table("./data/dataset/features.txt")
dim(features)
head(features, 20)
tail(features)
activity_labels <- read.table("./data/dataset/activity_labels.txt")
dim(activity_labels)
names(activity_labels) <- c("activity_code", "activity_label")

subject_train <- read.table("./data/dataset/train/subject_train.txt")
X_train <- read.table("./data/dataset/train/X_train.txt")
y_train <- read.table("./data/dataset/train/y_train.txt")
dim(X_train)
train <- cbind(X_train, subject_train, y_train)

subject_test <- read.table("./data/dataset/test/subject_test.txt")
X_test <- read.table("./data/dataset/test/X_test.txt")
y_test <- read.table("./data/dataset/test/y_test.txt")
dim(X_test)
dim(subject_test)
dim(y_test)
test <- cbind(X_test, subject_test, y_test)

# 1. merge train and test dataset
merged_df <- rbind(train, test)
names(merged_df) <- c(as.character(features$V2), "subject", "activity_code")
merged_df <- merged_df[, unique(names(merged_df))]
merged_df <- left_join(merged_df, activity_labels, by="activity_code")
table(merged_df$activity_label, merged_df$subject)
dim(merged_df)

# 2. extracts only the measurements on the mean and standard deviation for each measurement. 
merged_df <- select(merged_df, contains("subject"), contains("activity_label"), contains("mean"), contains("std"))
dim(merged_df)

# 3. uses descriptive activity names to name the activities in the data set
# already done

# 4. appropriately labels the data set with descriptive variable names. 
# already done

# 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.

avera <- aggregate(merged_df, by=list(merged_df$subject, merged_df$activity_label), FUN = mean)

View(head(avera))
dim(avera)
avera <- select(avera, -c("subject", "activity_label"))
dim(avera)

names(avera)[1:2] <- c("subject", "activity_label")

# write tidy dataset file:
write.table(avera, "./data/tidy_data.txt", row.name=FALSE)

dim(merged_df)
codebook <- data.frame(num = 1:88, code = names(merged_df), explain = names(merged_df))

View(codebook)
names(codebook)
write.table(codebook, "./data/codebook.txt", row.names = FALSE)

list(names(merged_df))
names(avera)



if (!file.exists("assignment")) {
  dir.create("assignment")
  if (!file.exists("assignment/UCI HAR Dataset")) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    hardatafileszip="assignment/UCI_HAR_data.zip"
    download.file(fileURL, destfile=hardatafileszip, method="curl")
    unzip(hardatafileszip, exdir="assignment")
  }
}

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("plyr")) {
  install.packages("plyr")
}

require("data.table")

features <- read.table("./assignment/UCI HAR Dataset/features.txt")[,2]

test.x <- read.table("./assignment/UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./assignment/UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./assignment/UCI HAR Dataset/test/subject_test.txt")

names(test.x) = features
names(test.subject) = "subject"

train.x <- read.table("./assignment/UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./assignment/UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./assignment/UCI HAR Dataset/train/subject_train.txt")

names(train.x) = features
names(train.subject) = "subject"

stdmeanfeatures <- grepl("mean()[^Freq]|std()", features)

stdmeantest.x = test.x[,stdmeanfeatures]
stdmeantrain.x = train.x[,stdmeanfeatures]

activity_labels <- read.table("./assignment/UCI HAR Dataset/activity_labels.txt")[,2]
test.y[,2] = activity_labels[test.y[,1]]
names(test.y) = c("activityid", "activitydesc")

train.y[,2] = activity_labels[train.y[,1]]
names(train.y) = c("activityid", "activitydesc")
names(train.subject) = "subject"


merged_train <- cbind(stdmeantrain.x, train.y, train.subject)
merged_test <- cbind(stdmeantest.x, test.y, test.subject)


completely_merged_data = rbind(merged_train, merged_test)

require("plyr")
tidy <- ddply(completely_merged_data, .(subject, activitydesc), function(x) colMeans(x[,1:60]))

write.table(tidy, "./assignment/UCI HAR Dataset/tidy.txt", row.names=FALSE)

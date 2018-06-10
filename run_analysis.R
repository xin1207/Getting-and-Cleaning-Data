library(plyr)

merge.datasets = function() {
  training.x <- read.table("UCI HAR Dataset/train/X_train.txt")
  training.y <- read.table("UCI HAR Dataset/train/y_train.txt")
  training.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
  test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
  test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
 
   # Merge
  merged.x <- rbind(training.x, test.x)
  merged.y <- rbind(training.y, test.y)
  merged.subject <- rbind(training.subject, test.subject)
  
  # Merge train and test datasets and return
  list(x=merged.x, y=merged.y, subject=merged.subject)
}


extract.mean.and.std = function(df) {
  features <- read.table("UCI HAR Dataset/features.txt")
  mean.col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
  std.col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
  edf <- df[, (mean.col | std.col)]
  colnames(edf) <- features[(mean.col | std.col), 2]
  edf
}


name.activities = function(df) {
  colnames(df) <- "activity"
  df$activity[df$activity == 1] = "WALKING"
  df$activity[df$activity == 2] = "WALKING_UPSTAIRS"
  df$activity[df$activity == 3] = "WALKING_DOWNSTAIRS"
  df$activity[df$activity == 4] = "SITTING"
  df$activity[df$activity == 5] = "STANDING"
  df$activity[df$activity == 6] = "LAYING"
  df
}


bind.data <- function(x, y, subjects) {
  cbind(x, y, subjects)
}


create.tidy.dataset = function(df) {
  tidy <- ddply(df, .(subject, activity), function(x) colMeans(x[,1:60]))
  tidy
}


clean.data = function() {
  merged <- merge.datasets()
  cx <- extract.mean.and.std(merged$x)
  cy <- name.activities(merged$y)
  colnames(merged$subject) <- c("subject")
  combined <- bind.data(cx, cy, merged$subject)
  tidy <- create.tidy.dataset(combined)
  write.csv(tidy, "UCI_HAR_tidy.csv", row.names=FALSE)
}
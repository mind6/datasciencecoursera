## Creating the first data set

# find the colums we wish to extract
read.table("features.txt")->feat
grep("-mean\\(\\)",feat[,2])->meanCols
grep("-std\\(\\)",feat[,2])->stdCols

# read in descriptive activity names
read.table("activity_labels.txt")->act_labels

# read in the train and test sets
read.table("train/subject_train.txt")->subject_train
read.table("train/X_train.txt")->X_train
read.table("train/y_train.txt")->y_train
read.table("test/subject_test.txt")->subject_test
read.table("test/X_test.txt")->X_test
read.table("test/y_test.txt")->y_test

# merge the subject, features, and response from training
# and test sets
subject_m <- rbind(subject_train, subject_test)
X_m <- rbind(X_train, X_test)
y_m <- rbind(y_train, y_test)

# convert the activity to labeled factors
factor(x=y_m[[1]],labels=act_labels[,2])->y_m

# combine into a single data frame
data.frame(subject_m, y_m,
           X_m[,c(meanCols, stdCols)])->dat1

# give the combined data frame meaningful names
names(dat1) <- c("subject", "activity", 
                as.character(feat[meanCols,2]), 
                as.character(feat[stdCols,2]))

## Creating the second data set

# split into a separate data frame for each subject and activity
split(dat1, list(dat1$subject, dat1$activity)) -> dat2

# find the feature means for each subject and activity
lapply(dat2, function(x)  colMeans(x[ , 3:ncol(x)])) -> dat3

# create a table which contains one row for each subject, activity,
# and the mean of feature values observed for it. 
res <- data.frame()
for (row in seq_along(dat3)) {
  #find the factor name of the current data frame split
  strsplit(names(dat3[row]),"\\.")->s
  df <- data.frame(subject=s[[1]][1], activity=s[[1]][2], 
                   as.list(dat3[[row]]))
  res <- rbind(res, df)
}
# prefex "u-" to column names to indicate these are mean values
# of observations in that group
colNames <- c("subject","activity",
              paste("u-",as.character(feat[meanCols,2]), sep=""),
              paste("u-",as.character(feat[stdCols,2]), sep=""))
names(res) <- colNames;

write.table(res, file="getdata-006-proj.txt", row.name=FALSE)

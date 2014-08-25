---
title: "UCI Human Activity Recognition Summary Codebook"
author: "Kirby Zhang"
date: "Sunday, August 24, 2014"
output: html_document
---

The UCI study monitored 30 subjects as they performed one of 6 physical activities while carrying a smartphone. The raw inertial signals were processed for time and frequency series information, forming a 561 dimensional feature vector.

For this summary, we consider the training and test datasets as a single merged set. We calculate the subject-activity group means for variables concerning *body acceleration*, *body acceleration jerk*, *body gyro*, *body gyro jerk*, and *gravity acceleration*. **Out of the 561 features, we chose the 66 which contained either "mean()" or "std()" in their original variable names. As a result, 66 means were calculated for each of 180 subject-activity groups.**


NOTE: the following abbreviations are used as a part of variable names.

* **u-**: indicates the value is a computed group mean based on the original features.
* **t**: time series data.
* **f**: frequencies series data.
* **mean()**: the original feature was a computed mean based on a time window.
* **std()**: the original feature was a computed standard deviation based on a time window.
* **X, Y, Z**: indicates the data is from one of 3 measurement axises provided by the smartphone.

###Variables

----------------------- | ----------------------
name: | **subject**
class: | Factor  
levels: | 1-30  
description: | identifier for each of the study subjects.

------------------------------------------------     

----------------------- | ----------------------
name: | **activity**  
class: | Factor  
levels: | WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING  
description:| describes the subject's activity at the time of signal observation.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-tBodyAcc-mean()-X,u-tBodyAcc-mean()-Y,u-tBodyAcc-mean()-Z,u-fBodyAcc-mean()-X,u-fBodyAcc-mean()-Y,u-fBodyAcc-mean()-Z,u-tBodyAcc-std()-X,u-tBodyAcc-std()-Y,u-tBodyAcc-std()-Z,u-fBodyAcc-std()-X,u-fBodyAcc-std()-Y,u-fBodyAcc-std()-Z**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of mean and std for time and frequencies series body acceleration data, each with 3 axises, for a total of 12 variables.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-tBodyAccJerk-mean()-X,u-tBodyAccJerk-mean()-Y,u-tBodyAccJerk-mean()-Z,u-fBodyAccJerk-mean()-X,u-fBodyAccJerk-mean()-Y,u-fBodyAccJerk-mean()-Z,u-tBodyAccJerk-std()-X,u-tBodyAccJerk-std()-Y,u-tBodyAccJerk-std()-Z,u-fBodyAccJerk-std()-X,u-fBodyAccJerk-std()-Y,u-fBodyAccJerk-std()-Z**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of mean and std for time and frequencies series body acceleration jerk data, each with 3 axises, for a total of 12 variables.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-tBodyGyro-mean()-X,u-tBodyGyro-mean()-Y,u-tBodyGyro-mean()-Z,u-fBodyGyro-mean()-X,u-fBodyGyro-mean()-Y,u-fBodyGyro-mean()-Z,u-tBodyGyro-std()-X,u-tBodyGyro-std()-Y,u-tBodyGyro-std()-Z,u-fBodyGyro-std()-X,u-fBodyGyro-std()-Y,u-fBodyGyro-std()-Z**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of computed mean and std for time and frequencies series body gyro data, each with 3 axises, for a total of 12 variables.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-tBodyGyroJerk-mean()-X,u-tBodyGyroJerk-mean()-Y,u-tBodyGyroJerk-mean()-Z,u-tBodyGyroJerk-std()-X,u-tBodyGyroJerk-std()-Y,u-tBodyGyroJerk-std()-Z**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of computed mean and std for time series body gyro jerk data, each with 3 axises, for a total of 6 variables.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-tGravityAcc-mean()-X,u-tGravityAcc-mean()-Y,u-tGravityAcc-mean()-Z,u-tGravityAcc-std()-X,u-tGravityAcc-std()-Y,u-tGravityAcc-std()-Z**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of computed mean and std for time series body gyro jerk data, each with 3 axises, for a total of 6 variables.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-tBodyAccMag-mean(),u-tGravityAccMag-mean(),u-tBodyAccJerkMag-mean(),u-tBodyGyroMag-mean(),u-tBodyGyroJerkMag-mean(),u-tBodyAccMag-std(),u-tGravityAccMag-std(),u-tBodyAccJerkMag-std(),u-tBodyGyroMag-std(),u-tBodyGyroJerkMag-std()**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of computed mean and std for time series body acceleration magnitude, its associated jerk, body gyro magnitude, its associated jerk, and gravity acceleration magnitude, for a total of 10 variables.
NOTE: | used `paste(var[grep("^u\\-t.*\\(\\)$",var)],collapse=",")` to find these names.

------------------------------------------------     

----------------------- | ----------------------
names: | **u-fBodyAccMag-mean(),u-fBodyBodyAccJerkMag-mean(),u-fBodyBodyGyroMag-mean(),u-fBodyBodyGyroJerkMag-mean(),u-fBodyAccMag-std(),u-fBodyBodyAccJerkMag-std(),u-fBodyBodyGyroMag-std(),u-fBodyBodyGyroJerkMag-std()**  
class: | Numeric  
levels: | Normalized to between -1.0 and 1.0
description:| average values of computed mean and std for frequency series body acceleration magnitude, its associated jerk, body gyro magnitude, and its associated jerk, for a total of 8 variables.

------------------------------------------------     

*The total number of summarized variables amounts to 66 variables -- 12, 12, 12, 6, 6, 10, and 8 variables respectively. There are 180 observations, one for each of 30 subjects and each of 6 possible activity states*
---
title: "Summarizing UCI Human Activity Recognition dataset"
author: "Kirby Zhang"
date: "Sunday, August 24, 2014"
output: html_document
---
*Publicly available Human Activity Recognition database from UCI is summarized. Mean values for time and frequency series data are calculated for each subject-activity pair found in the original features dataset. Results are written to a tidy data text table. The original study and data files can be found here: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#>*

###Files in this directory
* **README.md -** This file.
* **run_analysis.R -** R script used to create the tidy data summary.
* **getdata-006-proj.txt -** Data table created by the above script. You should use `read.table("getdata-006-proj.txt", header=TRUE, check.names=FALSE)` to read it into R.
* **Codebook.md -** Description of variables in the dataset above.
* **README.html, Codebook.html -** Generated HTML versions of the MD files.

###Analysis overview
After downloading and unzip the following file <http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip>, **run_analysis.R** is run from inside the "./UCI HAR Dataset" directory. The script performs the following manipulations:

* Merge the features and labels from the train and test datasets.
* Change the labels from integers to named activities.
* Create a new data frame containing subject id, activity, and a subset of the original measurement columns (only those which represented mean() or std() values).
* Split the above data frame by subject and activity.
* Calculate the column means for each of the above splits.
* Insert each result as a row in a new data frame.
* Write that data frame to **getdata-006-proj.txt**

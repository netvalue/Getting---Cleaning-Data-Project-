---
title: "README.Rmd"
date: "June 21, 2014"
output: html_document
---


run_analysis.R Description
========================================================

1. Concatenate columns from subject_test, y_test, X_Test files into a single data set
2. Concatenate columns from subject_train, y_train, X_Train files into a single data set
3. Combine the two data sets (from #3 and #6) into one using rbind
4. Extract required columns (mean and std cols) from data set in step #3. 
5. Read attribute informations from features.txt and assign the column names to the data set. Remove punctuation characters and use them to label column name correctly
6. Merge Data Set from #5 with Activity Data Frame on basis of ActivityID column
7. Perform the summarization on data set from #7
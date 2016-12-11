# Getting and Cleaning Data Course Project

This is the course project associated with the [Getting and Cleaning Data] course from
Johns Hopkins University on Coursera. The motivation for the project is 'to demonstrate
the ability to collect, work with, and clean a dataset'.

## Background

The project relates to a [Human Activity Recognition Using Smartphones] data set which
corresponds to data collected from accelerometers from the Samsung Galaxy S smartphone.

## Project Requirements

The data that the project uses is that mirrored from the following link:
[Project Data.](
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Based on the above data set, a script _run\_analysis.R_ is required that satisfies the
following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the
    average of each variable for each activity and each subject.

## _run\_analysis.R_ Usage

This is the that outputs a single, tidy file containing the average of mean and standard
deviation observations, by subject and activity.

### Quick

1. Either source the script by executing `source("_path_to_script_")` in the R-console, or
paste the contents of the script directly into the console and execute this.
2. Execute `run_analyis()` in the R-console to create the tidy dataset.

### Detailed

After the script is sourced (see the [Quick](###Quick) instructions above), the following
are arguments to the `run_analyis` function:

- **wd:** This is the working directory to which the source-data requirement is downloaded
    and extracted. It is also where the generated tidy dataset is created. If the script
    has been sourced from a file via `source("_path_to_script_")` then this defaults to
    the directory that contains the script. Otherwise (if the script was pasted directly
    into the console) this defaults to the value returned by the `getwd` function.
- **clean:** This is a boolean value that indicates whether the data requirement should be
    re-downloaded and extracted, regardless of whether the data-directory already exists
    in the working directory. This parameter defaults to `FALSE`.

Unless overridden using the `clean` parameter, the `run_analysis` function downloads its
data requirement if this does not already exist in the working directory. See the
associated 'CodeBook.md' for a description of the contents of the generated file.

[Getting and Cleaning Data]: https://www.coursera.org/learn/data-cleaning
[Human Activity Recognition Using Smartphones]:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


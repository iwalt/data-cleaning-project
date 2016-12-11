# Code Book

The script _run\_analysis.R_ creates a file `feature_averages.txt` which can be loaded by
executing:

``` r
averages <- read.table("path/to/feature_averages.txt", header = TRUE) 
```

The file comprises a set of averages of a set of observations, grouped by the `subject`
and `activity` variables, where:

- `subject` - This is the identifier of the test subject.
- `activity` - This is the label of the activity performed by the subject, one of:
    - `WALKING`
    - `WALKING_UPSTAIRS`
    - `WALKING_DOWNSTAIRS`
    - `SITTING`
    - `STANDING`
    - `LAYING`

## Measurement Averages

The remainder of the file comprises averages of a set of observations. These are the
observations that are described in the `features_info.txt` file in the `UCI HAR Dataset`
directory, filtered to only the those observations that describe mean and
standard-deviations.

The observations that have been averaged are themselves mean-normalised, as such the
values are unitless. Variable names correspond to the observation that has been averaged.
These are:

- `tBodyAcc.mean.X`
- `tBodyAcc.mean.Y`
- `tBodyAcc.mean.Z`
- `tBodyAcc.std.X`
- `tBodyAcc.std.Y`
- `tBodyAcc.std.Z`
- `tGravityAcc.mean.X`
- `tGravityAcc.mean.Y`
- `tGravityAcc.mean.Z`
- `tGravityAcc.std.X`
- `tGravityAcc.std.Y`
- `tGravityAcc.std.Z`
- `tBodyAccJerk.mean.X`
- `tBodyAccJerk.mean.Y`
- `tBodyAccJerk.mean.Z`
- `tBodyAccJerk.std.X`
- `tBodyAccJerk.std.Y`
- `tBodyAccJerk.std.Z`
- `tBodyGyro.mean.X`
- `tBodyGyro.mean.Y`
- `tBodyGyro.mean.Z`
- `tBodyGyro.std.X`
- `tBodyGyro.std.Y`
- `tBodyGyro.std.Z`
- `tBodyGyroJerk.mean.X`
- `tBodyGyroJerk.mean.Y`
- `tBodyGyroJerk.mean.Z`
- `tBodyGyroJerk.std.X`
- `tBodyGyroJerk.std.Y`
- `tBodyGyroJerk.std.Z`
- `tBodyAccMag.mean`
- `tBodyAccMag.std`
- `tGravityAccMag.mean`
- `tGravityAccMag.std`
- `tBodyAccJerkMag.mean`
- `tBodyAccJerkMag.std`
- `tBodyGyroMag.mean`
- `tBodyGyroMag.std`
- `tBodyGyroJerkMag.mean`
- `tBodyGyroJerkMag.std`
- `fBodyAcc.mean.X`
- `fBodyAcc.mean.Y`
- `fBodyAcc.mean.Z`
- `fBodyAcc.std.X`
- `fBodyAcc.std.Y`
- `fBodyAcc.std.Z`
- `fBodyAccJerk.mean.X`
- `fBodyAccJerk.mean.Y`
- `fBodyAccJerk.mean.Z`
- `fBodyAccJerk.std.X`
- `fBodyAccJerk.std.Y`
- `fBodyAccJerk.std.Z`
- `fBodyGyro.mean.X`
- `fBodyGyro.mean.Y`
- `fBodyGyro.mean.Z`
- `fBodyGyro.std.X`
- `fBodyGyro.std.Y`
- `fBodyGyro.std.Z`
- `fBodyAccMag.mean`
- `fBodyAccMag.std`
- `fBodyBodyAccJerkMag.mean`
- `fBodyBodyAccJerkMag.std`
- `fBodyBodyGyroMag.mean`
- `fBodyBodyGyroMag.std`
- `fBodyBodyGyroJerkMag.mean`
- `fBodyBodyGyroJerkMag.std`

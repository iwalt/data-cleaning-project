
# This forms part of the 'Getting and Cleaning Data' course project.

# The default working directory used by the 'run_analysis' function; if the
# scriptis loaded using the 'source' function, then this is the directory that
# contains the 'run_analysis.R' script. Otherwise (if the script is pasted
# directly into the console) this is the value returned by the 'getwd' function.
run_analysis.default_wd <-
    if (sys.nframe() > 0) {
        dirname(sys.frame(1)$ofile)
    } else {
        getwd()
    }

# The URI of the source data archive that is used by the run_analysis function.
run_analysis.data_uri <- paste0(
        "https://d396qusza40orc.cloudfront.net/",
        "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

# Perform the analysis; creates and writes out the combined, tidied dataset with
# averages of mean and standard-deviation by subject and activity. The
# requirements for this tidied dataset are described in the associated file 
# 'README.md', and see 'CodeBook.md' for a description of the contents of this
# dataset.
# Param: wd
#     The working directory used for the analysis; the location where source
#     files are downloaded.
# Param: clean
#     Whether the data requirement of the analysis should be redownloaded and
#     re-extracted, even if it is already present in the working directory.
run_analysis <- function (wd = run_analysis.default_wd, clean = FALSE) {
    
    if (!require("dplyr", quietly = TRUE)) {
        stop(paste0("Error: could not load package 'dplyr'. ",
                    "Please execute 'install.packages(\"dplyr\")'."))
    }
    
    # Set the working directory, ensuring that the previous can be restored.
    wd_restore <- getwd()
    setwd(wd)
    
    # Obtains a tidy observations dataset from the project source data-folder.
    # Param: ds
    #     Specifies which dataset is to be read; one of "train" or "test".
    # Param: dr
    #     Path that resolves to the root directory of the project source
    #     data-folder.
    get_observations <- function (ds, dr) {
        
        message(sprintf(paste0("%s dataset: Creating tidy mean and",
                               " standard-deviation features... "),
                        ds),
                appendLF = FALSE)
        
        # Mean and std features, with descriptive variable names.
        X_tidy <- {
            
            X <- read.table(file.path(dr, ds, sprintf("X_%s.txt", ds)))
            features <- read.table(file.path(dr, "features.txt"))
            
            mean_and_std_indices <- grep("-(mean|std)\\(\\)", features$V2)
            X <- X[, mean_and_std_indices]
            
            # Hyphens and parentheses are replaced by 'write.table'; strip
            # parentheses and leave hyphens to be replaced with periods.
            names(X) <- gsub("(\\(|\\))", "", features$V2[mean_and_std_indices])
            
            X
        }

        # Obtain label data, with descriptive factors and variable names.
        y_tidy <- {
            
            y <- read.table(file.path(dr, ds, sprintf("y_%s.txt", ds)))
            activity_labels <- read.table(file.path(dr, "activity_labels.txt"))
            
            names(activity_labels)[2] <- "activity"
            y <- suppressMessages(left_join(y, activity_labels))
            y$V1 <- NULL
            
            y
        }
        
        # Obtain subject data, with descriptive variable name.
        subject_tidy <- {
            
            subject <- read.table(
                file.path(dr, ds, sprintf("subject_%s.txt", ds)))
            names(subject) <- "subject"
            subject
        }
        
        # Merge tidied features, subjects and labels.
        observations_tidy <- cbind(subject_tidy, y_tidy, X_tidy)
        
        message("Done.")
        
        observations_tidy
    }
    
    # Verify that the project data is available.
    source_directory <- {
        
        directory <- "./UCI HAR Dataset"
        if (clean || !file.exists(directory)) {
            
            archive <- "UCI-HAR-Dataset.zip"
            download.file(
                run_analysis.data_uri, destfile = archive, mode = "wb")
            
            message("Extracting archive... ", appendLF = FALSE)
            unzip(archive)
            message("Done.")
        }
        
        directory
    }
    
    # Get the tidy train/test observations.
    train <-  get_observations("train", source_directory)
    test <- get_observations("test", source_directory)
    
    message("Merging tidy training and test datasets... ", appendLF = FALSE)
    all <- rbind(train, test)
    message("Done.")
    
    message("Calculating feature averages by subject and activity... ",
            appendLF = FALSE)
    feature_averages <-
        all %>% group_by(subject, activity) %>% summarise_all(mean)
    message("Done.")
    
    message("Writing output file...")
    filename <- "feature_averages.txt"
    write.table(feature_averages, file = filename, row.names = FALSE)
    
    message(
        sprintf("Output file written to '%s'.", file.path(getwd(), filename)))
    message(paste0("See the file 'CodeBook.md' for an explanation",
                   " of the contents of the output file."))
    
    # Restore the working directory in the calling environment.
    setwd(wd_restore)
}

message("Execute 'run_analysis()' to create the tidy dataset.")


# Project for 'Getting and Cleaning Data' course.

#' The default working directory used by the run_analysis function; this is the
#' directory that contains the 'run_analysis.R' script.
#' 
run_analysis.default_wd <- dirname(sys.frame(1)$ofile)

#' The URI of the source data archive that is used by the run_analysis function.
#' 
run_analysis.data_uri <- paste0(
        "https://d396qusza40orc.cloudfront.net/",
        "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

#' Perform the analysis.
#' 
#' @param wd
#'     The working directory used for the analysis; the location where source
#'     files are downloaded.
#' @param redownload
#'     Whether the data requirement of the analysis should be redownloaded if
#'     it already present in the working directory.
#'     
run_analysis <- function (wd = run_analysis.default_wd, redownload = FALSE) {
    
    wd_restore <- getwd()
    setwd(wd)
    
    {
        archive <- "UCI-HAR-Dataset.zip"
        if (redownload || !file.exists(archive)) {
            
            download.file(
                run_analysis.data_uri, destfile = archive, mode = "wb")
            
            message("Unzipping archive... ", appendLF = FALSE)
            unzip(archive)
            message("Done.")
        }
    }

    setwd(wd_restore)
}
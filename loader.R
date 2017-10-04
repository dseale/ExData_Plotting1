######## 
## Functions for downloading and loading data sets
## Requires data.table for fast reading using fread
########

library("data.table")

## If the source data set changes, these constants will need to be updated to match the source data
constants <- list(
                    sourceZip="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                    targetDirectory="Data",
                    sourceFile="Data/household_power_consumption.txt"
                  )


## Step 1: Get data sets and unzip to target; verify existence
downloadData <- function(targetFile="SourceData.zip", forceDownload=FALSE, reExtract=FALSE) {
     
     if(!dir.exists(constants[["targetDirectory"]])) {
          dir.create(constants[["targetDirectory"]])
     }   
     
     target <- paste(constants[["targetDirectory"]], targetFile, sep="/")
     
     if(forceDownload | !file.exists(target)){
          download.file(constants[["sourceZip"]], target)     
     }
     else {
          message("Source exists. Download skipped.")
     }
     
     if(reExtract | !file.exists(constants[["sourceFile"]])) {
          unzip(target, exdir=constants[["targetDirectory"]])
     }
     else {
          message("Data set exists. Unzip skipped.")
     }
     
}

## fast read access with fread/grep
loadData <- function() {

     grepString <- paste('grep -E "^1/2/2007|^2/2/2007"', file.path(getwd(), constants[["sourceFile"]]))
     
     sourceData <- fread(grepString, na.strings ="?")
     
     return(sourceData)
}












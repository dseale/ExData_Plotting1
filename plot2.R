######## 
## Create PNG file for a line chart on the dataset linked in the "loader.R" file
## use runPlot() after sourcing this script to create the output PNG
########

source("loader.R")


runPlot <- function(pWidth=480, pHeight=480, pngName="plot2.png", background="white") {
     
     ## from loader.R ##
     downloadData()
     filteredData <- loadData()
     ###################

     png(pngName, width=pWidth, height=pHeight, bg=background)
     plot(strptime(paste(filteredData$V1,filteredData$V2), "%d/%m/%Y %H:%M:%S"), filteredData$V3, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     
     dev.off()

}







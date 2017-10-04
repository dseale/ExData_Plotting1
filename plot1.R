######## 
## Create PNG file for a histogram on the dataset linked in the "loader.R" file
## use runPlot() after sourcing this script to create the output PNG
########

source("loader.R")


runPlot <- function(pWidth=480, pHeight=480, pngName="plot1.png", background="white") {
     
     ## from loader.R ##
     downloadData()
     filteredData <- loadData()
     ###################
     
     png(pngName, width=pWidth, height=pHeight, bg=background)
     hist(filteredData$V3,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylab = "Frequency", col = "red")
     
     dev.off()

}







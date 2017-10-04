######## 
## Create PNG file for a multi-line plot on the dataset linked in the "loader.R" file
## use runPlot() after sourcing this script to create the output PNG
########

source("loader.R")


runPlot <- function(pWidth=480, pHeight=480, pngName="plot4.png", background="white") {
     
     ## from loader.R ##
     downloadData()
     filteredData <- loadData()
     ###################
     
     
     timeSource <- strptime(paste(filteredData$V1,filteredData$V2), "%d/%m/%Y %H:%M:%S")
     
     png(pngName, width=pWidth, height=pHeight, bg=background)
     
     par(mfrow=c(2,2))
     
     ## top left quandrant
     plot(timeSource, filteredData$V3, type="l", xlab="", ylab="Global Active Power")
     
     ## top right quandrant
     plot(timeSource, filteredData$V5, type="l", xlab="datetime", ylab="Voltage")
     
     ## bottom left quandrant
     plot(timeSource, filteredData$V7, type="l", col="black", xlab="", ylab="Energy sub metering")
     lines(timeSource, filteredData$V8, col="red")
     lines(timeSource, filteredData$V9, col="blue")
     legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
     
     ## bottom right quandrant
     plot(timeSource, filteredData$V4, type="n", xlab="datetime", ylab="Global_reactive_power")
     lines(timeSource, filteredData$V4)
    
     
     dev.off()

}







plot3 <- function()
{
        # this will set the date format for myDate which is as per data in the data file        
        setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
        setClass('myDate')
        data <- read.csv("data/household_power_consumption.txt", sep=";" , colClasses =c("myDate", "character", "character", "character", "character", "character", "character", "character", "character"))
        #sub set the data  for the range specified by the problem statemene
        data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
        data <- data[complete.cases(data),]
        #paste date and and time and create a new col named dateTime
        data$dateTime <- paste(as.character(data$Date), data$Time)
        
        png(file="plot3.png", bg="transparent")
        plot(strptime(data$dateTime, "%Y-%m-%d %H:%M:%S"), as.numeric(data$Sub_metering_1), ylab="Energy Submetering", xlab = "", type="l")
        lines(strptime(data$dateTime, "%Y-%m-%d %H:%M:%S"), as.numeric(data$Sub_metering_2),  col="red")
        lines(strptime(data$dateTime, "%Y-%m-%d %H:%M:%S"), as.numeric(data$Sub_metering_3),  col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty=1, col=c("black", "red", "blue"))
        
        dev.off()
     
        
}
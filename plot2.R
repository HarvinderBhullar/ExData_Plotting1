plot2 <- function()
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
        
        png(file="plot2.png", bg="transparent")
        plot(strptime(data$dateTime, "%Y-%m-%d %H:%M:%S"), as.numeric(data$Global_active_power), ylab="Global Active Power (kilowatts)", xlab = "", type="l")
        
        dev.off()
      
}
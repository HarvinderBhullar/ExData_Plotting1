##this function generates the histogram for global active power
# and save it inside a png file names plot1.png

plot1 <- function()
{
        # this will set the date format for myDate which is as per data in the data file        
        setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
        setClass('myDate')
        data <- read.csv("data/household_power_consumption.txt", sep=";" , colClasses =c("myDate", "character", "character", "character", "character", "character", "character", "character", "character"))
        #sub set the data  for the range specified by the problem statemene
        data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
        data <- data[complete.cases(data),]
        png(file="plot1.png", bg="transparent")
        #generate histogram for global active power
        hist(as.numeric(x$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
        dev.off()
}




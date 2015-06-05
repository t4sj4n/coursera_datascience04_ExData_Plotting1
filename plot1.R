# set working directory to ExData_Plotting1 repository

# load libraries
library(lubridate)

# read data & do filtering & cleaning
data_raw <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = FALSE)
data <- data_raw[(data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")

#plot 1
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
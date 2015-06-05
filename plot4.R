# set working directory to ExData_Plotting1 repository

# load libraries
library(lubridate)

# read data & do filtering & cleaning
data_raw <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactor = FALSE)
data <- data_raw[(data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")

# axis labeling for plots 2-4
# static solution
label_positions <- c(which(!duplicated(data$Date)), nrow(data)+1)
labels <- c("Thu", "Fri", "Sat")

# plot 4
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))
# plot4.1
plot(data$Global_active_power, type = "l", ylab = "Global Active Power", xlab=NA, xaxt = "n")
axis(side = 1, at = label_positions, labels = labels)
# plot4.2
plot(data$Voltage, type = "l", ylab = "Voltage", xlab="datetime", xaxt = "n")
axis(side = 1, at = label_positions, labels = labels)
# plot4.3
plot(data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab=NA, xaxt = "n")
lines(data$Sub_metering_2, col = "red") 
lines(data$Sub_metering_3, col = "blue") 
axis(side = 1, at = label_positions, labels = labels)
legend("topright", lwd = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4.4
plot(data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime", xaxt = "n")
axis(side = 1, at = label_positions, labels = labels)
dev.off()
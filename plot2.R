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
# dynamic solution ...
#substring(wday(data[label_positions,]$Date, label = TRUE), 1, 3) # first 3 chars of label

#plot 2
png(file="plot2.png",width=480,height=480)
plot(data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=NA, xaxt = "n")
axis(side = 1, at = label_positions, labels = labels)
dev.off()
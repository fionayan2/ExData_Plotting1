## read in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## subset data from 01/02/2007 to 02/02/2007 (DD/MM/YYYY)
data2 <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")

## convert the Date and Time variables to Date/Time classes
library(lubridate)
data2$datetime <- strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")

## convert character to numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

## plot1
png(file="plot1.png", width = 480, height = 480)

hist(data2$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power"
)

dev.off()
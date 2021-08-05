## read in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")

## subset data from 01/02/2007 to 02/02/2007 (DD/MM/YYYY)
data2 <- subset(data, Date == "1/2/2007"|Date == "2/2/2007")

## convert the Date and Time variables to Date/Time classes
library(lubridate)
data2$datetime <- strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")

## convert character to numeric
data2$Global_active_power <- as.numeric(data2$Global_active_power)

## plot3
png(file="plot3.png", width = 480, height = 480)

plot(data2$datetime, 
     data2$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l"
)

lines(data2$datetime,data2$Sub_metering_2, col = "red")

lines(data2$datetime,data2$Sub_metering_3, col = "blue")

legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

dev.off()
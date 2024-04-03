#set working directory

setwd("C:/Users/Admin/Desktop/ExData_Plotting1")

#import file

file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# use only subset of data

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
hist(data[, 3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
Sys.setlocale("LC_TIME", "English")
date_converted <- as.Date(data[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data[, 2]))
plot(time_axis, data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, 8], col = "red")
lines(time_axis, data[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)
par(mfrow = c(2,2))

#2nd plot

plot2<-plot(time_axis, data[, 5], xlab = "datetime", ylab = "Voltage", type = "l")
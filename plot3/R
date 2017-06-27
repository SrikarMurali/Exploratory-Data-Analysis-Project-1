data <- read.table("C:/Users/Nathan/Documents/John Hopkins Data Science Coursera Projects/household_power_consumption.txt", header = T, sep = ";", na.strings = "?",                    colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
data <- data[complete.cases(data),]

## Combine Date and Time column
times <- paste(data$Date, data$Time)

## Name the vector
times <- setNames(times, "DateTime")

## Remove Date and Time column
data <- data[ ,!(names(data) %in% c("Date","Time"))]

## Add DateTime column
data <- cbind(times, data)

## Format dateTime Column
data$times <- as.POSIXct(times)

with(data, {
  plot(Sub_metering_1~times, type="l", 
       ylab = "Energy Sub Metering", xlab = "")
  lines(Sub_metering_2~times, col = "Red")
  lines(Sub_metering_3~times, col = "Blue")
})
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,'plot3.png')
dev.off()

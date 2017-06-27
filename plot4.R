


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


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(Global_active_power ~ times, type = "l", ylab = "Global Active Power")
  plot(Voltage ~ times, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Sub_metering_1~times, type="l", 
       ylab = "Energy Sub Metering", xlab = "")
  lines(Sub_metering_2~times, col = "Red")
  lines(Sub_metering_3~times, col = "Blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1,lwd =2, bty = "n", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ times, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.copy(png,'plot4.png')
dev.off()


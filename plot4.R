rm(list=ls())
gc()
# read data and ? convert to NA
data_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
# use and filter data from 2007-02-01 to 2007-02-02
data <- data_all[data_all$Date %in% c("1/2/2007", "2/2/2007"),]
# approppriate time format format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") # change data format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))
  #plot 1
  plot(data$Global_active_power ~ data$Datetime, 
     ylab="Global Active Power", type = "l", xlab = "")
  #plot 2
  plot(data$Voltage ~ data$Datetime, 
       ylab="Voltage", type = "l", xlab = "datetime")
  #plot3
  plot(data$Sub_metering_1 ~ data$Datetime, 
       ylab="Energy sub metering", type = "l", xlab = "")
  lines(data$Sub_metering_2 ~ data$Datetime, col = "red")
  lines(data$Sub_metering_3 ~ data$Datetime, col = "blue")
  legend("topright", col = c("black","blue", "red"), lty = 1, lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  #plot4
  plot(data$Global_reactive_power ~ data$Datetime, 
       ylab="Global_reactive_power", type = "l", xlab = "datetime")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
  
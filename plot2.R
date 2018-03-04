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

#plot2
plot(data$Global_active_power ~ data$Datetime, 
     ylab="Global Active Power (kilowatts)", type = "l", xlab = "")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

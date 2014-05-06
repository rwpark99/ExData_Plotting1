##Plot1
library("data.table")
Sys.setlocale("LC_TIME", "C")
setwd = "C:/Users/Administrator/Documents/data"
datafile <-fread("data/household_power_consumption.txt", na.strings="?", sep=";", header=FALSE, 
                 nrows = 2879,skip = 66637, colClasses=c("Date", "Time", rep("numeric", 7)))
colnames <- c("Date", "Time", "Global_active_power" , "Global_reactive_power", "Voltage",
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setnames(datafile,names(datafile),colnames)
png("data/plot1.png", width=480, height=480)
par(mfrow=c(1,1), mar=c(4,4,2,1))
hist(datafile$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col = "red")
dev.off()
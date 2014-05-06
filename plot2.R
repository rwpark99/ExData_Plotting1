##Plot2
library("data.table")
Sys.setlocale("LC_TIME", "C")
setwd = "C:/Users/Administrator/Documents/data"
datafile <-fread("data/household_power_consumption.txt", na.strings="?", sep=";", header=FALSE, 
                 nrows = 2880,skip = 66637, colClasses=c("character", "Time", rep("numeric", 7)))
colnames <- c("Date", "Time", "Global_active_power" , "Global_reactive_power", "Voltage",
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setnames(datafile,names(datafile),colnames)
datafile$Date <-as.Date(datafile$Date, format="%d/%m/%Y" )
png("data/plot2.png", width=480, height=480)
par(mfrow=c(1,1), mar=c(4,4,2,1))
with(datafile, plot(Global_active_power, xlab="",
                    ylab="Global Active Power (kilowatts)", type="n", xaxt="n" ))
with(datafile, lines(Global_active_power))
weekdaylables <- c(
        weekdays(datafile$Date[1], abbreviate=T),
        weekdays(datafile$Date[1441], abbreviate=T),
        weekdays(datafile$Date[2880]+ 1, abbreviate=T)
)
axis(1,at=c(1,1441,2881), labels=weekdaylables)
dev.off()

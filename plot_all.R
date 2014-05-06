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

##Plot3
library("data.table")
Sys.setlocale("LC_TIME", "C")
setwd = "C:/Users/Administrator/Documents/data"
datafile <-fread("data/household_power_consumption.txt", na.strings="?", sep=";", header=FALSE, 
                 nrows = 2880,skip = 66637, colClasses=c("character", "Time", rep("numeric", 7)))
colnames <- c("Date", "Time", "Global_active_power" , "Global_reactive_power", "Voltage",
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setnames(datafile,names(datafile),colnames)
datafile$Date <-as.Date(datafile$Date, format="%d/%m/%Y" )
png("data/plot3.png", width=480, height=480)
par(mfrow=c(1,1), mar=c(4,4,2,1))
with(datafile, plot(Sub_metering_1, xlab="",
                    ylab="Energy sub metering", type="n", xaxt="n" ))
with(datafile, {
        lines(Sub_metering_1)
        lines(Sub_metering_2, col="red")
        lines(Sub_metering_3, col="blue")     
})

legend("topright", lty = "solid", col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       xjust = .5, yjust = .5)

weekdaylables <- c(
        weekdays(datafile$Date[1], abbreviate=T),
        weekdays(datafile$Date[1441], abbreviate=T),
        weekdays(datafile$Date[2880]+ 1, abbreviate=T)
)
axis(1,at=c(1,1441,2881), labels=weekdaylables)
dev.off()

##Plot4
library("data.table")
Sys.setlocale("LC_TIME", "C")
setwd = "C:/Users/Administrator/Documents/data"
datafile <-fread("data/household_power_consumption.txt", na.strings="?", sep=";", header=FALSE, 
                 nrows = 2880,skip = 66637, colClasses=c("character", "Time", rep("numeric", 7)))
colnames <- c("Date", "Time", "Global_active_power" , "Global_reactive_power", "Voltage",
              "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
setnames(datafile,names(datafile),colnames)
datafile$Date <-as.Date(datafile$Date, format="%d/%m/%Y" )
png("data/plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1),
    cex.lab=0.9, cex.axis=0.9, cex.main=0.9, cex.sub=0.9)

#1
with(datafile, plot(Global_active_power, xlab="",
                    ylab="Global Active Power", type="n", xaxt="n" ))
with(datafile, lines(Global_active_power))
weekdaylables <- c(
        weekdays(datafile$Date[1], abbreviate=T),
        weekdays(datafile$Date[1441], abbreviate=T),
        weekdays(datafile$Date[2880]+ 1, abbreviate=T)
)
axis(1,at=c(1,1441,2881), labels=weekdaylables)
#2
with(datafile, plot(Voltage, xlab="datetime",
        ylab="Voltage", type="n", xaxt="n" ))
with(datafile, lines(Voltage))
weekdaylables <- c(
        weekdays(datafile$Date[1], abbreviate=T),
        weekdays(datafile$Date[1441], abbreviate=T),
        weekdays(datafile$Date[2880]+ 1, abbreviate=T)
)
axis(1,at=c(1,1441,2881), labels=weekdaylables)

#3
with(datafile, plot(Sub_metering_1, xlab="",
                    ylab="Energy sub metering", type="n", xaxt="n" ))
with(datafile, {
        lines(Sub_metering_1)
        lines(Sub_metering_2, col="red")
        lines(Sub_metering_3, col="blue")     
})

legend(2500, 35, lty = "solid", col=c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       xjust = 0.7, yjust = 0.7,  fill=NULL, border=FALSE, bty="n", cex=0.8)

weekdaylables <- c(
        weekdays(datafile$Date[1], abbreviate=T),
        weekdays(datafile$Date[1441], abbreviate=T),
        weekdays(datafile$Date[2880]+ 1, abbreviate=T)
)
axis(1,at=c(1,1441,2881), labels=weekdaylables)

#4
with(datafile, plot(Global_reactive_power, xlab="datetime",
        ylab="Global_reactive_power", type="n", xaxt="n" ))
with(datafile, lines(Global_reactive_power))
weekdaylables <- c(
        weekdays(datafile$Date[1], abbreviate=T),
        weekdays(datafile$Date[1441], abbreviate=T),
        weekdays(datafile$Date[2880]+ 1, abbreviate=T)
)
axis(1,at=c(1,1441,2881), labels=weekdaylables)
dev.off()
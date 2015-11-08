x<- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
datetime <- paste(x$Date, x$Time, sep = " ")
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
x$datetime<-datetime
x$Date <- NULL
x$Time <- NULL
startdate <-strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
enddate <- strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S")
x<-x[x$datetime >= startdate & x$datetime < enddate,]
x<-na.omit(x)
dev.set(3)
png('plot3.png')
plot(x$datetime, x$Sub_metering_1, ylab = "Energy sub metering", xlab = '',type = 'n')
lines(x$datetime, x$Sub_metering_1)
lines(x$datetime, x$Sub_metering_2,col = "red")
lines(x$datetime, x$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, cex = .85)
dev.off()

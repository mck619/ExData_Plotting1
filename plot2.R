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
png('plot2.png')
plot(x$datetime, x$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = '',type = 'n')
lines(x$datetime, x$Global_active_power)
dev.off()
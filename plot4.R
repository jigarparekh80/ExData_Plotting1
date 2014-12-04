#unzip("exdata-data-household_power_consumption.zip")

## reads only data for 2007-02-01 and 2007-02-02
data<-read.table(file="household_power_consumption.txt",header = T, sep = ";",na.strings = "?",skip=66636,nrows=2880)
## assigns column names 
names(data) <- strsplit(readLines("household_power_consumption.txt",1),";",fixed=TRUE)[[1]]

## converts character to date 
data$datetime <- paste(data$Date,data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480, units = "px", bg = "transparent")

par(mfrow = c(2, 2))

## top left
plot(data$datetime,data$Global_active_power,type="l",ylab = "Global Active Power",xlab="")

## top right
plot(data$datetime,data$Voltage,type="l",ylab = "Voltage",xlab="datetime")

## bottom left
plot(data$datetime,data$Sub_metering_1,type="l",col = "black",ylab="Energy sub metering",xlab="")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright", pch = NA , col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=1)

## bottom right
plot(data$datetime,data$Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab="datetime")
dev.off()
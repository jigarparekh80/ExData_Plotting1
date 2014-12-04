#unzip("exdata-data-household_power_consumption.zip")

## reads only data for 2007-02-01 and 2007-02-02
data<-read.table(file="household_power_consumption.txt",header = T, sep = ";",na.strings = "?",skip=66636,nrows=2880)
## assigns column names 
names(data) <- strsplit(readLines("household_power_consumption.txt",1),";",fixed=TRUE)[[1]]

## converts character to date 
data$datetime <- paste(data$Date,data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480, units = "px", bg = "transparent")
plot(data$datetime,data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()

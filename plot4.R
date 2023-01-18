library(dplyr)

power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
power_dates <- filter(power, Date %in% c("1/2/2007","2/2/2007"))

power_dates$DateTime <- strptime(paste(power_dates$Date,power_dates$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(power_dates$DateTime, power_dates$Global_active_power, xlab=NA, ylab="Global Active Power (kilowatts)", type="l")

plot(power_dates$DateTime, power_dates$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(power_dates$DateTime, power_dates$Sub_metering_1, xlab=NA, ylab="Energy sub metering", type="l", col="black")
lines(power_dates$DateTime, power_dates$Sub_metering_2, xlab=NA, ylab="Energy sub metering", type="l", col="red")
lines(power_dates$DateTime, power_dates$Sub_metering_3, xlab=NA, ylab="Energy sub metering", type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), pch="-", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power_dates$DateTime, power_dates$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


dev.off()
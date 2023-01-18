library(dplyr)

power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
power_dates <- filter(power, Date %in% c("1/2/2007","2/2/2007"))

power_dates$DateTime <- strptime(paste(power_dates$Date,power_dates$Time),"%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480)

plot(power_dates$DateTime, power_dates$Global_active_power, xlab=NA, ylab="Global Active Power (kilowatts)", type="l")
     
dev.off()
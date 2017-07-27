totalData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec = ".")

totalData$Date <- as.Date(totalData$Date, format = "%d/%m/%Y")

Data <- subset(totalData, subset = Date >= "2007-02-01" & Date <= "2007-02-02")

rm(totalData)

datetime <- paste(Data$Date, Data$Time)

Data$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(Data$Global_active_power)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(Data$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(Data$Datetime, Data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Data$Datetime, Data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(Data$Datetime, Data$Sub_metering_2, type="l", xlab="", ylab="", col = "red")
lines(Data$Datetime, Data$Sub_metering_3, type="l", xlab="", ylab="", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1.5, col=c("black", "red", "blue"), bty="n" )

plot(Data$Datetime, Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_relative_power")

dev.off() 

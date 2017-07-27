
totalData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec = ".")

totalData$Date <- as.Date(totalData$Date, format = "%d/%m/%Y")

Data <- subset(totalData, subset = Date >= "2007-02-01" & Date <= "2007-02-02")

rm(totalData)

datetime <- paste(Data$Date, Data$Time)

Data$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(Data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(Data$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off() 





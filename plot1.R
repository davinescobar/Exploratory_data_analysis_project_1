
totalData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE, dec = ".")

totalData$Date <- as.Date(totalData$Date, format = "%d/%m/%Y")

Data <- subset(totalData, subset = Date >= "2007-02-01" & Date <= "2007-02-02")

rm(totalData)

png("plot1.png", width=480, height=480)

hist(Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()


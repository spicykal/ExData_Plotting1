data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Global Active Power Plot
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Voltage Plot
Voltage <- as.numeric(subSetData$Voltage)

#Energy Sub Metering Plot
SM1 <- as.numeric(subSetData$Sub_metering_1)
SM2 <- as.numeric(subSetData$Sub_metering_2)
SM3 <- as.numeric(subSetData$Sub_metering_3)
 
#Global Reactive Power Plot
GRP <- as.numeric(subSetData$Global_reactive_power)

#2x2 Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, SM1, type="l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SM2, col = "red")
lines(datetime, SM3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(datetime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
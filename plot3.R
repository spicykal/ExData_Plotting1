data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(subSetData$Sub_metering_1)
SM2 <- as.numeric(subSetData$Sub_metering_2)
SM3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, SM1, type="l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SM2, col = "red")
lines(datetime, SM3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue")) 
dev.off()

##Load the data and account for NA values represented by "?".

newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000,stringsAsFactors=FALSE)

newFile$DateTime <- paste(newFile$Date, newFile$Time)
newFile$DateTime <- as.Date(newFile$DateTime, format = "%d/%m/%Y %H:%M:%S")

##Filter csv to include dates of interest for building the charts.
library(dplyr)
subsetted <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
head(subsetted)

subsetted_df <- tbl_df(subsetted)

hist(subsetted$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


##Saving the file to R working Directory
dev.copy(png,'plot1.png', width = 480, height = 480, units = "px")
dev.off()


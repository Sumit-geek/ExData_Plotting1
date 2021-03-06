file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febDaysData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(febDaysData$Date, febDaysData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
febDaysData$Global_active_power <- as.numeric(febDaysData$Global_active_power)
febDaysData$Sub_metering_1 <- as.numeric(febDaysData$Sub_metering_1)
febDaysData$Sub_metering_2 <- as.numeric(febDaysData$Sub_metering_2)
febDaysData$Sub_metering_3 <- as.numeric(febDaysData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, febDaysData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, febDaysData$Sub_metering_2, type="l", col="red")
lines(datetime, febDaysData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
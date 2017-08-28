file <- "./data/household_power_consumption.txt"
hpc <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febDaysData <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

febDaysData$Global_active_power <- as.numeric(febDaysData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(febDaysData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
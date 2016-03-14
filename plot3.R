data_all <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(data_all, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Date_Time <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsetData$Global_active_power)

subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


plot(Date_Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_Time, subMetering2, type="l", col="red")
lines(Date_Time, subMetering3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height= 480, width= 480)
dev.off()




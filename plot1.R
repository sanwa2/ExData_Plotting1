data_all <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(data_all, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

GlobalActivePower <- as.numeric(subsetData$Global_active_power)

hist(GlobalActivePower, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.copy(png, file="plot1.png", height= 480, width= 480)
dev.off()
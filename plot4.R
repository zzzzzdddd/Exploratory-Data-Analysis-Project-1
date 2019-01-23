file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
realtime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y%H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Voltage <- as.numeric(data$Voltage)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(realtime, data$Global_active_power, col = "black",xlab="",ylab="Global Active Power (kilowatts)", type <- "l")

plot(realtime, data$Voltage, col = "black", xlab = "datetime", ylab = "Voltage", type <- "l", lwd = 0.2)

plot(realtime, data$Sub_metering_1, col = "black", type <- "l",xlab="",ylab="Energy sub metering")
lines(realtime,data$Sub_metering_2,col="red")
lines(realtime,data$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(realtime, data$Global_reactive_power, col = "black", xlab = "datetime", ylab = "Global_reactive_power", type <- "l", lwd = 0.2)

dev.off()
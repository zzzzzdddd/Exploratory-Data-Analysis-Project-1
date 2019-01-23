file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
realtime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y%H:%M:%S") 

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
png("plot3.png", width=480, height=480)
plot(realtime, data$Sub_metering_1, col = "black", type <- "l",xlab="",ylab="Energy sub metering")
lines(realtime,data$Sub_metering_2,col="red")
lines(realtime,data$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

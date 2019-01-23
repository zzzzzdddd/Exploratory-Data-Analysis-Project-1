file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
realtime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y%H:%M:%S") 

data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(realtime, data$Global_active_power, col = "black",xlab="",ylab="Global Active Power (kilowatts)", type <- "l")
dev.off()

file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##data[,1] <- as.Date(strptime(data[,1],"m-d-Y"))

data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

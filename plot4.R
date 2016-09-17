# PLOT 4 FOR THE COURSE PROJECT 1 by Didac Fortuny (sep-2016)

# Read data file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Convert the variables to proper classes
data$Date_time <- strptime(paste(as.character(data$Date), as.character(data$Time), sep=" "), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# Subset the data
firstDate <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
lastDate <- strptime("02/02/2007 23:59:59", "%d/%m/%Y %H:%M:%S")
data <- subset(data, Date_time >= firstDate & Date_time <= lastDate)

# Plot
Sys.setlocale("LC_TIME", "English")
png(file="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(data$Date_time,data$Global_active_power, type = "n", xlab="", ylab="Global Active Power")
lines(data$Date_time,data$Global_active_power)

plot(data$Date_time,data$Voltage, type = "n", xlab="datetime", ylab="Voltage")
lines(data$Date_time,data$Voltage)

plot(data$Date_time,data$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(data$Date_time,data$Sub_metering_1, col="black")
lines(data$Date_time,data$Sub_metering_2, col="red")
lines(data$Date_time,data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.95, bty="n")

plot(data$Date_time,data$Global_reactive_power, type = "n", xlab="datetime", ylab="Global_reactive_power")
lines(data$Date_time,data$Global_reactive_power)

dev.off()

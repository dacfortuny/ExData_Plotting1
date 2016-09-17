# PLOT 2 FOR THE COURSE PROJECT 1 by Didac Fortuny (sep-2016)

# Read data file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Convert the variables to proper classes
data$Date_time <- strptime(paste(as.character(data$Date), as.character(data$Time), sep=" "), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Subset the data
firstDate <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
lastDate <- strptime("02/02/2007 23:59:59", "%d/%m/%Y %H:%M:%S")
data <- subset(data, Date_time >= firstDate & Date_time <= lastDate)

# Plot
Sys.setlocale("LC_TIME", "English")
png(file="plot2.png", width = 480, height = 480)
plot(data$Date_time,data$Global_active_power, type = "n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$Date_time,data$Global_active_power)
dev.off()

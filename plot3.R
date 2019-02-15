#read the file
file <- 'household_power_consumption.txt'
data <- read.table(text = grep("^[1, 2]/2/2007", readLines(file), value=TRUE), sep = ';', col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), na.strings = '?')
#convert the date and time variables
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format = '%Y-%m-%d %H:%M:%S')
#plot the file
png(filename = 'plot3.png', width = 480, height = 480, units='px')
plot(data$datetime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$datetime, data$Sub_metering_2, col = 'red')
lines(data$datetime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()

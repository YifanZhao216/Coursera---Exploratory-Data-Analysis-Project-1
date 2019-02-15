#read the file
file <- 'household_power_consumption.txt'
data <- read.table(text = grep("^[1, 2]/2/2007", readLines(file), value=TRUE), sep = ';', col.names = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), na.strings = '?')
#convert the date and time variables
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = '%H:%M:%S')
#plot the file
png(filename = 'plot1.png', width = 480, height = 480, units='px')
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red'))
dev.off()

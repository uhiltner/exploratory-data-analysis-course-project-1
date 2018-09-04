# plot4.R ----
dataFile <- "./data/household_power_consumption.txt"
# read data with column types specified.
data <- readr::read_delim(file = dataFile, delim = ";", col_names = TRUE, 
                          na = "?",
                          col_types = readr::cols(
                              Date = readr::col_date(format = "%d/%m/%Y"),
                              Time = readr::col_time(format = "%H:%M:%S"), 
                              Global_active_power = readr::col_double(),
                              Global_reactive_power = readr::col_double(),
                              Voltage = readr::col_double(),
                              Global_intensity = readr::col_double(),
                              Sub_metering_1 = readr::col_double(),
                              Sub_metering_2 = readr::col_double(),
                              Sub_metering_3 = readr::col_double()
                          ))

# Using data from the dates 2007-02-01 until 2007-02-02.
subsetData <- dplyr::filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")
# Transform Date and Time to Datetime   
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), 
                     "%Y-%m-%d %H:%M:%S") 

# Visualize count of global active power in graphic device on PC.
png("plot4.png", width = 480, height = 480) # open graphic device
par(mfrow = c(2, 2)) 
# panel topleft
plot(datetime, subsetData$Global_active_power, 
     type = "l", 
     xlab = " ", 
     ylab = "Global Active Power")
# panel topright
plot(datetime, subsetData$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")
# bottom left
plot(datetime, subsetData$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(datetime, subsetData$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(datetime, subsetData$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, bty = "n",
       col = c("black", "red", "blue"))
# bottom right
plot(datetime, subsetData$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off() # close graphic device
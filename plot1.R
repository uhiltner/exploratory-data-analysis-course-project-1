# plot1.R ----
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

# Visualize count of global active power in graphic device on PC.
png("plot1.png", width = 480, height = 480) # open graphic device
hist(subsetData$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatt)", 
     col = "red")
dev.off() # close device
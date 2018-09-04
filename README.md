---
title: 'Exploratory Data Analysis: Peer-graded Assignment: Course Project 1'
author: "Ulrike Hiltner"
date: '2018-08-28'
output:
  html_notebook:
    toc: yes
    toc_depth: '5'
  html_document:
    toc: yes
    toc_depth: '5'
---

# Instructions

This assignment uses data from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/index.php), a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:

## Dataset: Electric power consumption [20Mb]

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

  +  Date: Date in format dd/mm/yyyy
  
  +  Time: time in format hh:mm:ss
  
  +  Global_active_power: household global minute-averaged active power (in kilowatt)
  
  +  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
  
  +  Voltage: minute-averaged voltage (in volt)
  
  +  Global_intensity: household global minute-averaged current intensity (in ampere)
  
  +  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
  
  +  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
  
  +  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
  

## Loading the data

When loading the dataset into R, please consider the following:

  +  The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).

  +  We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

  +  You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

  +  Note that in this dataset missing values are coded as ?.

## Making Plots

Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

For each plot you should

  +  Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

  +  Name each of the plot files as plot1.png, plot2.png, etc.

  +  Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.

  +  Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files.


The four plots that need to be constructed are shown below.

```{r plot1}

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

```


```{r plot2}

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
png("plot2.png", width=480, height=480) # open graphic device.
plot(datetime, subsetData$Global_active_power, 
     type = "l", 
     xlab = " ", 
     ylab = "Global Active Power (kilowatt)")
dev.off() # close graphic device.

```


```{r plot3}

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
png("plot3.png", width = 480, height = 480) # open graphic device
plot(datetime, subsetData$Sub_metering_1, 
     type = "l", 
     ylab = "Energy Submetering", xlab = "")
lines(datetime, subsetData$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(datetime, subsetData$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, 
       col = c("black", "red", "blue"))
dev.off() # close device

```


```{r plot4}

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
     ylab = "Energy Submetering", xlab = "")
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

```


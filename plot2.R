#######################################################################
## Programmer: GP
## Date: 9/2/2020
## Project: ExData_Plotting1.RProj
## Description: This file plots the Global Active Power in kilowatts as a function of time 
## or the two dates requested.
#######################################################################

# Run the file getData.R before running this file to get the zip file and extract it.
# getData.R also loads required libraries: dplyr, lubridate
# The file "household_power_consumption.txt" should now be in your working directory. 

# Read the data into R and set the column names:
dataFile <- "./household_power_consumption.txt"
pdataNames <- read.table(dataFile,sep = ";",
                         nrows = 1, na.strings = "?")

pdata <- read.table(dataFile, sep = ";",
                    na.strings = "?" ,
                    col.names = pdataNames,
                    colClasses = c("character","character","numeric","numeric",
                                   "numeric","numeric","numeric","numeric","numeric"),
                    skip = 1)

# Convert the Date column from a character type to a POSIX recognized data format:
pdata$Date <- dmy(pdata$Date)

# Subset the data for the two days needed:
pdata <- subset(pdata, pdata$Date == '2007-02-01' | pdata$Date == '2007-02-02' )

# Combine Date and Time into one column and add to dataframe:
dateAndTime <-strptime(paste(pdata$Date," ",pdata$Time),format = "%Y-%m-%d %H:%M:%S",tz = "")
pdata2 <- cbind(pdata,dateAndTime)

# Open a png graphics device, make the plot, then close the device
png(filename = "plot2.png")

plot(pdata2$dateAndTime,pdata2$Global_active_power,pch = "",
     xlab = "", ylab= "Global Active Power (kilowatts)")
lines(pdata2$dateAndTime[1:2880],pdata$Global_active_power[1:2880])
dev.off()

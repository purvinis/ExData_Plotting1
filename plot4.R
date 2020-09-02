#######################################################################
## Programmer: GP
## Date: 9/2/2020
## Project: ExData_Plotting1.RProj
## Description: This file plots four different graphs of power versus time
## for the two dates requested.
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

# Open a png graphics device, make the plot, then close the device. 
# Default size is 480 x 480.

png(filename = "plot4.png")

par(mfcol = c(2,2),mar = c(4,4,2,2))

#top left plot
plot(pdata2$dateAndTime,pdata2$Global_active_power,pch = "",
     xlab = "", ylab= "Global Active Power (kilowatts)",mex = 0.8,cex.lab = 0.8)
lines(pdata2$dateAndTime[1:2880],pdata$Global_active_power[1:2880])

#bottom left plot
plot(pdata2$dateAndTime,pdata2$Sub_metering_1,pch = "",
     xlab = "", ylab= "Energy sub metering",mex = 0.8,cex.lab = 0.8)
lines(pdata2$dateAndTime[1:2880],pdata2$Sub_metering_1[1:2880])
lines(pdata2$dateAndTime[1:2880],pdata2$Sub_metering_2[1:2880],col = "red")
lines(pdata2$dateAndTime[1:2880],pdata2$Sub_metering_3[1:2880],col = "blue")
legend("topright",pch = "",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 0.8,bty = "n")

#top right plot
plot(pdata2$dateAndTime,pdata2$Voltage,pch = "",
     xlab = "datetime", ylab= "Voltage")
lines(pdata2$dateAndTime[1:2880],pdata2$Voltage[1:2880])

#bottom right plot
plot(pdata2$dateAndTime,pdata2$Global_reactive_power,pch = "",
     xlab = "datetime", ylab= "Voltage")
lines(pdata2$dateAndTime[1:2880],pdata2$Global_reactive_power[1:2880])

dev.off()

# This file plots a histogram of the Global Active Power in kilowatts for two days

# Run the file getData.R before running this file to get the zip file and extract it.
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

# Open a png graphics device, make the plot, then close the device
png(filename = "plot1.png")

hist(pdata$Global_active_power,col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()


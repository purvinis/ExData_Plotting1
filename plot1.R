# This file plots a histogram of the Global Active Power in kilowatts for two days

# Run the file getData.R before running this file
#The file "household_power_consumption.txt" should now be in your working directory. 
source("./getData.R")

# After running source(), a file called pdata is in this R environment
#The file contains two days of data

# Open a png graphics device, make the plot, then close the device
png(filename = "plot1.png")

hist(pdata$Global_active_power,col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()


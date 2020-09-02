
# Run the file getData.R before running this file
#The file "household_power_consumption.txt" should now be in your working directory. 
source("./getData.R")

# After running source(), a file called pdata is in this R environment
#The file contains two days of data

# Convert the Time column into a time format:
pdata$Time <- hms(pdata$Time)

plot(1:2880,pdata$Global_active_power,pch = "")
lines(1:2880,pdata$Global_active_power[1:2880])

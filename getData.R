# Load needed packages and download the data
library(dplyr)
library(tidyr)
library(lubridate)
library(data.table)

# dataset: electric power consumption in one household
dataUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#download.file(dataUrl,"rawdata.zip")            #download zip to current directory
#unzip("rawdata.zip")                            #unzip in current directory

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


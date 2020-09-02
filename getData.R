# Load needed packages and download the data
library(dplyr)
library(tidyr)
library(lubridate)
library(data.table)

# dataset: electric power consumption in one household
dataUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(dataUrl,"rawdata.zip")            #download zip to current directory
unzip("rawdata.zip")                            #unzip in current directory




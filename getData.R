#######################################################################
## Programmer: GP
## Date: 9/2/2020
## Project: ExData_Plotting1.RProj
## Description: Exploratory Data Week 1 Assignment
## This file downloads and extracts the zipped data, and loads libraries
#######################################################################

# Load needed packages and download the data
library(dplyr)
library(tidyr)
library(lubridate)
library(data.table)

# dataset: electric power consumption in one household
dataUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(dataUrl,"rawdata.zip")            #download zip to current directory
unzip("rawdata.zip")                            #unzip in current directory




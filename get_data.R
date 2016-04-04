#Using sqldf to read part of the data file
library("sqldf")

#Global variables for data locations, features and activities
data_source_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_dir = "./data"
data_zip_file = "household_power_consumption.zip"
data_file = "household_power_consumption.txt"

#Download and unpack source data
get_data_file <- function() {
  
  if(!file.exists(data_dir)) {dir.create(data_dir)}
  
  download.file(data_source_url, destfile = paste0(data_dir, "/", data_zip_file), method = "curl")
  unzip(paste0(data_dir, "/", data_zip_file), exdir = data_dir)
  
}

import_data <- function() {
  
  #Import just the required date range
  hpc_df <- read.csv2.sql(paste0(data_dir, "/", data_file), sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007' ")
  
  #Convert dates and times
  hpc_df$Date <- strptime(paste(hpc_df$Date, hpc_df$Time), format = "%d/%m/%Y %H:%M:%S")
  hpc_df <- subset(hpc_df, select = -Time)
  
  hpc_df
}

source("get_data.R")

if(!file.exists(paste0(data_dir, "/", data_file))) {
  get_data()
}

hpc_df <- import_data()

png("plot1.png")
hist(hpc_df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
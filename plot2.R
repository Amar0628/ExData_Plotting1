source("get_data.R")

if(!file.exists(paste0(data_dir, "/", data_file))) {
  get_data()
}

hpc_df <- import_data()

png("plot2.png")
plot(hpc_df$Date, hpc_df$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()
source("get_data.R")

if(!file.exists(paste0(data_dir, "/", data_file))) {
  get_data()
}

hpc_df <- import_data()

png("plot3.png")
plot(hpc_df$Date, hpc_df$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(hpc_df$Date, hpc_df$Sub_metering_2, col = "red")
lines(hpc_df$Date, hpc_df$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.off()

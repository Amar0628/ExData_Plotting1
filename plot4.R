source("get_data.R")

if(!file.exists(paste0(data_dir, "/", data_file))) {
  get_data()
}

hpc_df <- import_data()

png("plot4.png")
par(mfrow = c(2,2))
plot(hpc_df$Date, hpc_df$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
plot(hpc_df$Date, hpc_df$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
plot(hpc_df$Date, hpc_df$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(hpc_df$Date, hpc_df$Sub_metering_2, col = "red")
lines(hpc_df$Date, hpc_df$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
with(hpc_df, (plot(Date, Global_reactive_power, xlab = "datetime", type = "l")))
dev.off()

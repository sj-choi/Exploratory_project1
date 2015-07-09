#############
## plot4.R ##
#############
# Using the same data frame generated in 'plot1.R'.
df <- read.csv("filtered_data.csv") 
# Draw 'plot4', which consists of four plots in a 2x2 grid.
par(mfrow=c(2,2))
# Top-left plot, which is plot2.
plot(Global_active_power~as.POSIXct(datetime),
     data=df,
     type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")

# Top-right plot
plot(Voltage~as.POSIXct(datetime),
     data=df,
     type="l",
     xlab="datetime", ylab="Voltage")

# Bottom-left plot, which is plot3.
plot(df$Sub_metering_1~as.POSIXct(df$datetime), 
     type="l", 
     xlab="", ylab = "Energy sub metering",
     col="black")
# Add two more sets of data points in different color.
points(as.POSIXct(df$datetime), df$Sub_metering_2, type="l", col="red")
points(as.POSIXct(df$datetime), df$Sub_metering_3, type="l", col="blue")
# Make a legend on the top-right corner of the plot.
legend("right", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1,
       bty="n")

# Bottom-right plot
plot(Global_reactive_power~as.POSIXct(datetime), 
     data=df,
     type="l", 
     xlab="datetime", ylab = "Global_Reactive_Time")

# Draw 'plot4', which consists of four plots in a 2x2 grid.
dev.copy(png, file = "plot4.png", width=900, height=900) ## Make a PNG format plot.
dev.off() ## Close the graphic device.

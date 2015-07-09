#############
## plot3.R ##
#############
# Using the same data frame generated in 'plot1.R'.
df <- read.csv("filtered_data.csv") 
# Draw 'plot3'.
plot(Sub_metering_1~as.POSIXct(datetime),
     data=df,
     type="l", 
     xlab="", ylab = "Energy sub metering",
     col="black")
# Add two more sets of data points in different color.
points(as.POSIXct(df$datetime), df$Sub_metering_2, type="l", col="red")
points(as.POSIXct(df$datetime), df$Sub_metering_3, type="l", col="blue")
# Make a legend on the top-right corner of the plot.
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)
dev.copy(png, file = "plot3.png", width=480, height=480) ## Make a PNG format plot.
dev.off() ## Close the graphic device.

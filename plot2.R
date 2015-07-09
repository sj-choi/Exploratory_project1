#############
## plot2.R ##
#############
# Using the same data frame generated in 'plot1.R'.
df <- read.csv("filtered_data.csv") 
# Draw 'plot2'.
plot(Global_active_power~as.POSIXct(datetime),
     data=df,
     type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width=480, height=480) ## Make a PNG format plot.
dev.off() ## Close the graphic device.

############################################
## Coursera JHU Exploratory data analysis ##
############################################
setwd("/Users/choisj70/Downloads/Coursera/JHU_data_science/4_Exploratory_Data_Analysis_2015/prj1")
raw.df.1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Data filtering for the assigned analysis
library(dplyr)
# Change date format
df.0 <- raw.df.1 %>% mutate(Date = as.Date(Date, "%d/%m/%Y")) 

# Choose subset data by instructed criteria
df_ <- df.0 %>% filter(Date == "2007-02-01" | Date == "2007-02-02") 

# New variable with Date and Time together
datetime <- as.POSIXct(paste(df_$Date, df_$Time))

# Adding the new variable 'datetime' to the existing data frame 'df_'
df_ <- data.frame(df_, datetime)


# Save the subset data 
write.csv(df_, file = "filtered_data.csv", row.names=F) 

# Remove the temporary data sets in the memory.
rm(df_, df.0, raw.df.1, datetime) 


## plot1.R ##
# Start with the saved csv file.
df <- read.csv("filtered_data.csv")
# Draw 'plot1'.
hist(df$Global_active_power,
     main = "Golbal Active Power", 
     xlab = "Golbal Active Power (kilowatts)",
     col = "red")
dev.copy(png, file = "plot1.png", width=480, height=480) ## Make a PNG format plot.
dev.off() ## Close the graphic device.


## plot2.R ##
# Using the same data frame generated in 'plot1.R'.
df <- read.csv("filtered_data.csv") 
# Draw 'plot2'.
plot(Global_active_power~as.POSIXct(datetime),
     data=df,
     type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width=480, height=480) ## Make a PNG format plot.
dev.off() ## Close the graphic device.


## plot3.R ##
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


## plot4.R : working on it
# Using the same data frame generated in 'plot1.R'.
df <- read.csv("filtered_data.csv") 
# Draw 'plot4', which consists of four plots in a 2x2 grid.
par(mfrow=c(2,2))
# Top-left plot, which is plot2.
plot(Global_active_power~as.POSIXct(datetime),
     data=df,
     type="l", 
     xlab="", ylab = "Global Active Power",
     cex.lab=0.7,
     cex.axis=0.7)

# Top-right plot
plot(Voltage~as.POSIXct(datetime),
     data=df,
     type="l",
     xlab="datetime", ylab="Voltage",
     cex.lab=0.7,
     cex.axis=0.7)

# Bottom-left plot, which is plot3.
plot(df$Sub_metering_1~as.POSIXct(df$datetime), 
     type="l", 
     xlab="", ylab = "Energy sub metering",
     col="black",
     cex.lab=0.7,
     cex.axis=0.7)
# Add two more sets of data points in different color.
points(as.POSIXct(df$datetime), df$Sub_metering_2, type="l", col="red")
points(as.POSIXct(df$datetime), df$Sub_metering_3, type="l", col="blue")
# Make a legend on the top-right corner of the plot.
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1,
       bty="n",
       cex=0.7)

# Bottom-right plot
plot(Global_reactive_power~as.POSIXct(datetime), 
     data=df,
     type="l", 
     xlab="datetime", ylab = "Global_Reactive_Time",
     cex.lab=0.7,
     cex.axis=0.7)

# Draw 'plot4', which consists of four plots in a 2x2 grid.
dev.copy(png, file = "plot4.png", width=480, height=480) ## Make a PNG format plot.
dev.off() ## Close the graphic device.


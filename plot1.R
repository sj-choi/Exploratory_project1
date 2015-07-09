#############
## plot1.R ##
#############
## Assuming data file in the working directory
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

# Start with the saved csv file.
df <- read.csv("filtered_data.csv")
# Draw 'plot1'.
hist(df$Global_active_power, 
     main = "Golbal Active Power", 
     xlab = "Golbal Active Power (kilowatts)",
     col = "red")
dev.copy(png, file = "plot1.png", width=480, height=480) ## Make a PNG format plot.
dev.off() ## Close the graphic device.





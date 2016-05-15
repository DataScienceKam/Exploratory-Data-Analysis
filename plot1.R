library(sqldf)
setwd("C:/Users/Kam/Desktop/DataScientist/ExploratoryData_Graphs/exdata-data-household_power_consumption")
first_date <- "1/2/2007"
second_date <- "2/2/2007"
textfile <- "household_power_consumption.txt"
fi <- file(textfile)
query <- "select * from fi WHERE Date == '1/2/2007' OR Date == '2/2/2007'"
df <- sqldf(query, file.format = list(header = TRUE, sep = ";"))
close(fi)
head(df, 5)
colnames(df)
# dmy("1/2/2007")
library(dplyr)
library(lubridate)

# conversion of data types
#include a datetime column
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
df$Date <-as.Date(df$Date,"%m/%d/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Voltage <- as.numeric(df$Voltage)
head(df, 5)

#Subset data
gap <- df$Global_active_power
grp <- df$Global_reactive_power
voltage <- df$Voltage
subM1 <- df$Sub_metering_1
subM2 <- df$Sub_metering_2
subM3 <- df$Sub_metering_3

# plot 1
png("plot1.png", width=480, height=480)
hist(gap, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

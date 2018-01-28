#Course 4 assignment 1

library(dplyr)
library(lubridate)

#setting working directory and downloading data
setwd("C:/Users/Jenny/Documents/Coursera/Course4")
dat<-read.table("C:/Users/Jenny/Documents/Coursera/Course4/household_power_consumption.txt", header=TRUE, sep = ";",
                na.strings = "?")

#making a new date column with the class POSIXct as opposed to class factor
dat<-mutate(dat, date=dmy(Date))

#filtering data to the days we want
dat<-filter(dat, date>="2007-02-01" & date<="2007-02-02")

hist(dat$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)",
     main="Global Active Power", ymax=1200)

dev.copy(png, file="plot1.png")
dev.off()
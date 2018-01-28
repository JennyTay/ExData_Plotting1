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

#making a date time column
g<-with(dat, date +hms(Time))
dat2<-cbind(dat,g)
dat2<-rename(dat2,datetime=g)

#plotting the time with the global active power
with(dat2, plot(datetime,Global_active_power, ylab = "Global Active Power (kilowatts)", type="l", xlab=""))

#saving to a png
dev.copy(png, file="plot2.png")
dev.off()

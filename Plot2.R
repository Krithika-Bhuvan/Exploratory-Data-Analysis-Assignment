setwd("C:\\1_Shared_with_Mac\\4_personal\\tutorials\\2015Coursera_DataScience\\exploratory_data_analysis\\ExpDataAna_Proj1")

first5rows <- read.csv(file = "household_power_consumption.txt",sep=";", header=T,nrows = 5)
classes <- sapply(first5rows, class) #applying same class to all rows

input2 <- read.csv.sql(file = "household_power_consumption.txt", sep=";" , header = T, sql="select * from file where Date in ('1/2/2007','2/2/2007')",colClasses = classes)
### Tried reading them as "Date" variable, but did not work
### read.csv.sql worked on windows but not on mac. Says it needs R 3.0.1

#OR --- use this -- specify colclasses and nrow to make the read faster
inputAll <- as.data.frame(read.table("household_power_consumption.txt",sep=";", header = TRUE,na.strings = "?",stringsAsFactors=T,colClasses = classes,nrows=2075259))
input3 <- subset(inputAll, (inputAll$Date=="1/2/2007" |inputAll$Date=="2/2/2007" ))

## Plot 2
### did not work
Date_time <- as.POSIXct(paste(as.Date(input2$Date), input2$Time), tz = "GMT")
input2A <- {}
input2A <- cbind(input2,Date_time )
plot(x=input2A$Date_time, y=input2A$Global_active_power,type="n",ylab="Global Active Power (kilowatts)")
lines(x=input2A$Date_time, y=input2A$Global_active_power, col="black")

### worked
library(lubridate)
png(file="plot2.png")
date_time <- dmy_hms(paste(input2$Date, input2$Time),tz = "GMT")
input4 <- {}
input4 <- cbind(input2,date_time )
plot(x=input4$date_time, y=input4$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(x=input4$date_time, y=input4$Global_active_power, col="black")
dev.off()
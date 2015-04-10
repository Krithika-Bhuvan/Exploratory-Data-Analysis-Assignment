setwd("C:\\1_Shared_with_Mac\\4_personal\\tutorials\\2015Coursera_DataScience\\exploratory_data_analysis\\ExpDataAna_Proj1")

first5rows <- read.csv(file = "household_power_consumption.txt",sep=";", header=T,nrows = 5)
classes <- sapply(first5rows, class) #applying same class to all rows

input2 <- read.csv.sql(file = "household_power_consumption.txt", sep=";" , header = T, sql="select * from file where Date in ('1/2/2007','2/2/2007')",colClasses = classes)
### Tried reading them as "Date" variable, but did not work
### read.csv.sql worked on windows but not on mac. Says it needs R 3.0.1

#OR --- use this -- specify colclasses and nrow to make the read faster
inputAll <- as.data.frame(read.table("household_power_consumption.txt",sep=";", header = TRUE,na.strings = "?",stringsAsFactors=T,colClasses = classes,nrows=2075259))
input3 <- subset(inputAll, (inputAll$Date=="1/2/2007" |inputAll$Date=="2/2/2007" ))

##### Plot3
png(file="plot3.png")
plot(x=input4$date_time, y=input4$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(x=input4$date_time, y=input4$Sub_metering_1, col="black")
lines(x=input4$date_time, y=input4$Sub_metering_2, col="red")
lines(x=input4$date_time, y=input4$Sub_metering_3, col="blue")
legend("topright",pch="-",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
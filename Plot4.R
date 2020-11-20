## plot 4


## Reading the text file
Hhpower<-read.table("C:/Users/chand_rqrb1g/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")
dim(Hhpower)

## Renaming the variables

names(Hhpower)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(Hhpower)

## Creating subsets for the two dates 

subHhpower<-subset(Hhpower,Hhpower$Date=="1/2/2007"|Hhpower$Date=="2/2/2007")
head(subHhpower)

## Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively

library(lubridate)

subHhpower$Date<-as.Date(subHhpower$Date, format="%d/%m/%Y")
DateTime<-paste(as.Date(subHhpower$Date),subHhpower$Time)
subHhpower$DateTime<-as.POSIXct(DateTime)

head(subHhpower)

## Calling Plot 4

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(subHhpower,{
  plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(DateTime,Sub_metering_2,col="red")
  lines(DateTime,Sub_metering_3,col="blue") 
  legend ("topright",col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime,Global_reactive_power,type="l", ylab="Global Reactive Power (Kilowatts)",xlab="")
})

## plot4 in png

png("plot4.png",height = 480,width = 480)
dev.off() 

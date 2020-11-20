## plot 1


## Reading the text file
Hhpower<-read.table("C:/Users/chand_rqrb1g/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",skip=1,sep=";")
dim(Hhpower)

## Renaming the variables

names(Hhpower)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(Hhpower)

## Creating subsets for the two dates 

subHhpower<-subset(Hhpower,Hhpower$Date=="1/2/2007"|Hhpower$Date=="2/2/2007")
head(subHhpower)

## Plot 1-Calling the base plot histogram

hist(as.numeric(as.character(subHhpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Saving into a PNG file with width & height 480 pixels

png("plot1.png",width=480,height = 480)
dev.off()
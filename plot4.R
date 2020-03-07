fi<-"C:/Users/jency/OneDrive/Documents/household_power_consumption.txt"
data<-read.table(fi,header = TRUE, sep=";" ,stringsAsFactors=FALSE, dec = ".")
da<-subset(data,Date %in%  c("1/2/2007","2/2/2007"))

datetime<-strptime(paste(da$Date, da$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global<-as.numeric(da$Global_active_power)
png("Plot4.png")#default width=480 pixels and height=480 pixels
par(mfcol=c(2,2))

plot(datetime,global, type="l", xlab="", ylab="Global Active Power (kilowatts)")


sub1<-as.numeric(da$Sub_metering_1) 
sub2<-as.numeric(da$Sub_metering_2)
sub3<-as.numeric(da$Sub_metering_3)
plot(datetime,sub1,type="l", xlab="", ylab="Energy sub metering")
lines(datetime,sub2,type="l",col="red")
lines(datetime,sub3,type="l",col="blue")
legend("topright",lty=1, lwd=2.5,col = c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

volt<-as.numeric(da$Voltage)
plot(datetime,volt,type = "l",xlab = "datetime",ylab = "Voltage")

globalpower<-as.numeric(da$Global_reactive_power)
plot(datetime,globalpower,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()
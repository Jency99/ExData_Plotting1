fi<-"C:/Users/jency/OneDrive/Documents/household_power_consumption.txt"
data<-read.table(fi,header = TRUE, sep=";" ,stringsAsFactors=FALSE, dec = ".")
da<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime<-strptime(paste(da$Date, da$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1<-as.numeric(da$Sub_metering_1) 
sub2<-as.numeric(da$Sub_metering_2)
sub3<-as.numeric(da$Sub_metering_3)
png("plot3.png")#default width=480 pixels and height=480 pixels
plot(datetime,sub1,type="l", xlab="", ylab="Energy sub metering")
lines(datetime,sub2,type="l",col="red")
lines(datetime,sub3,type="l",col="blue")
legend("topright",lty=1, lwd=2.5,col = c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

dev.off()
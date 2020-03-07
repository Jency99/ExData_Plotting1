fi<-"C:/Users/jency/OneDrive/Documents/household_power_consumption.txt"
data<-read.table(fi,header = TRUE, sep=";" , dec = ".")
da<-subset(data,Date %in%  c("1/2/2007","2/2/2007"))

datetime<-strptime(paste(da$Date, da$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global<-as.numeric(da$Global_active_power)
png("Plot2.png")#default width=480 pixels and height=480 pixels
plot(datetime,global, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


fi<-"C:/Users/jency/OneDrive/Documents/household_power_consumption.txt"
data<-read.table(fi,header = TRUE, sep=";" , dec = ".")
da<-subset(data,Date %in%  c("1/2/2007","2/2/2007"))
global<-as.numeric(da$Global_active_power)
png("Plot1.png")#default width=480 pixels and height=480 pixels
hist(global,main = "Global active Power",xlab = "Global active Power (kilowatts)",col="red")
dev.off()


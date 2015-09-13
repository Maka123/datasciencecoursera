# Program to plot the 3 submetering readings for the 2 given days

getdata <- read.table('household_power_consumption.txt',header=T,sep=";") # reads data file

#subsets the required number of rows for 01.02.2007 to 02.02.2007
sub<-getdata[66637:69516,]

# To extract Submetering 1
sub1<-sub[,7]
sub1=as.character(sub1)
sub1=as.numeric(sub1)

# To extract Submetering 1
sub2<-sub[,8]
sub2=as.character(sub2)
sub2=as.numeric(sub2)

# To extract Submetering 1
sub3<-sub[,9]
sub3=as.character(sub3)
sub3=as.numeric(sub3)

# to get the weekdays of the given dates
sub$Datetime<-strptime(paste(sub$Date,sub$Time),format="%d/%m/%Y %H:%M:%S")
b<-sub[,10]

# Plot the graph
par(mfcol=c(1,1),mar= c(5.5,5.5,2,1))
plot(b,sub1,type="l",ylab="Energy sub metering",xlab="")
lines(b,sub2,col="red")
lines(b,sub3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),inset=c(0.05,0),cex=0.55,bty="n")

# to copy the graph to png of 480 by 480 pixels size
dev.print(png,file="plot3.png",width=480,height=480)
dev.off

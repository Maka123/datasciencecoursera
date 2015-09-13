# Program to plot the 4 in 1 page graph of the given requirements

getdata <- read.table('household_power_consumption.txt',header=T,sep=";")  # reads data file


#subsets the required number of rows for 01.02.2007 to 02.02.2007

<-getdata[66637:69516,]

# data for plotting 1st graph
a<-sub[,3]
a=as.character(a)
a=as.numeric(a)
sub$Datetime<-strptime(paste(sub$Date,sub$Time),format="%d/%m/%Y %H:%M:%S")
b<-sub[,10]

# data for plotting 2nd graph
sub1<-sub[,7]
sub1=as.character(sub1)
sub1=as.numeric(sub1)
sub2<-sub[,8]
sub2=as.character(sub2)
sub2=as.numeric(sub2)
sub3<-sub[,9]
sub3=as.character(sub3)
sub3=as.numeric(sub3)

# data for plotting 3rd graph
vol<-sub[,5]
vol=as.character(vol)
vol=as.numeric(vol)

# data for plotting 4th graph
RP<-sub[,4]
RP=as.character(RP)
RP=as.numeric(RP)

# Plot the 4 in 1 graph
par(mfcol=c(2,2),mar= c(5,5,2,1))

plot(b,a,type="l",ylab="Global Active Power",xlab="")

plot(b,sub1,type="l",ylab="Energy sub metering",xlab="")
lines(b,sub2,col="red")
lines(b,sub3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),inset=c(0.1,0),cex=0.55,bty="n")

plot(b,vol,type="l",ylab="Voltage",xlab="datetime")

plot(b,RP,type="l",ylab="Global_reactive_power",xlab="datetime",)

# to copy the graph to png of 480 by 480 pixels size
dev.print(png,file="plot4.png",width=480,height=480)
dev.off

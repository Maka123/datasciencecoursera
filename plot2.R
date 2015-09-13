# Program to plot the Global Active Power for the 2 days

getdata <- read.table('household_power_consumption.txt',header=T,sep=";") # reads data file


sub<-getdata[66637:69516,]   #subsets the required number of rows for 01.02.2007 to 02.02.2007

# to extract the Global Active Power
a<-sub[,3]
a=as.character(a)
a=as.numeric(a)

# to get the weekdays of the given dates
sub$Datetime<-strptime(paste(sub$Date,sub$Time),format="%d/%m/%Y %H:%M:%S")
b<-sub[,10]

# plot the graph
plot(b,a,type="l",ylab="Global Active Power(kilowatts)",xlab="")

# to copy the graph to png of 480 by 480 pixels size

dev.print(png,file="plot2.png",width=480,height=480)
dev.off

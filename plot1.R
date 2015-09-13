# Program to create the Histogram of Global Active Power 

getdata <- read.table('household_power_consumption.txt',header=T,sep=";") # reads data file


sub<-getdata[66637:69516,]  # subsets the required number of rows for 01.02.2007 to 02.02.2007

# to extract the Global Active Power
a<-sub[,3]
a=as.character(a)
a=as.numeric(a)

# to plot the histogram 

hist(a,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

# to copy the graph to png of 480 by 480 pixels size

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off
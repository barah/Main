dataComplete <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
dataComplete$MergedDate <- strptime(paste(dataComplete$Date, dataComplete$Time), "%d/%m/%Y %H:%M:%S")
dataComplete$Date2 <- as.Date(dataComplete$Date, format="%d/%m/%Y") 
data <- subset(dataComplete, as.Date(dataComplete$Date2) >= as.Date("2007-2-1") & dataComplete$Date2<= as.Date("2007-2-2"))
data$Global_active_power <- as.numeric(data$Global_active_power)

with(data, plot(as.numeric(Sub_metering_1), type="l",col="black",ylab="Energy Sub metering"))
with(data, lines(Sub_metering_2, type="l",col="red"))
with(data, lines(Sub_metering_3, type="l",col="blue"))
legend("topright",lty=c(1,1), pch=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png")
dev.off()


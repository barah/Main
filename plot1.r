dataComplete <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
dataComplete$MergedDate <- strptime(paste(dataComplete$Date, dataComplete$Time), "%d/%m/%Y %H:%M:%S")
dataComplete$Date2 <- as.Date(dataComplete$Date, format="%d/%m/%Y") 
data <- subset(dataComplete, as.Date(dataComplete$Date2) >= as.Date("2007-2-1") & dataComplete$Date2<= as.Date("2007-2-2"))
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Gobal Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()




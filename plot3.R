powerdata <- read.csv(file="household_power_consumption.txt",sep = ";" , stringsAsFactors=FALSE)
powerdata$Date2 <- as.Date(powerdata$Date, format = "%d/%m/%Y")
twodaydata <- powerdata[powerdata$Date2 == "2007-02-01" | powerdata$Date2 == "2007-02-02",]

twodaydata$Time <- strptime(paste(twodaydata$Date,twodaydata$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

png(filename="plot3.png", width = 480 , height = 480)
plot(twodaydata$Time, twodaydata$Sub_metering_1, type="n",
     ylab = "Energy sub metering", xlab ="", main = "")
lines(twodaydata$Time, twodaydata$Sub_metering_1, col = "black")
lines(twodaydata$Time, twodaydata$Sub_metering_2, col = "red")
lines(twodaydata$Time, twodaydata$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1)
dev.off()
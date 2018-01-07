powerdata <- read.csv(file="household_power_consumption.txt",sep = ";" , stringsAsFactors=FALSE)
powerdata$Date2 <- as.Date(powerdata$Date, format = "%d/%m/%Y")
twodaydata <- powerdata[powerdata$Date2 == "2007-02-01" | powerdata$Date2 == "2007-02-02",]

twodaydata$Global_active_power <- as.numeric(twodaydata$Global_active_power)
twodaydata$Time <- strptime(paste(twodaydata$Date,twodaydata$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

png(filename="plot2.png", width = 480 , height = 480)
plot(twodaydata$Time, twodaydata$Global_active_power,type="l",
     ylab = "Global Active Power (Kilowatts)", xlab ="", main = "")
dev.off()
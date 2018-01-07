powerdata <- read.csv(file="household_power_consumption.txt",sep = ";" , stringsAsFactors=FALSE)
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
twodaydata <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02",]

twodaydata$Global_active_power <- as.numeric(twodaydata$Global_active_power)

png(filename="plot1.png", width = 480 , height = 480)
hist(twodaydata$Global_active_power, xlab = "Global Active Power (Kilowatts)" ,
     main = "Global Active Power" , col = "blue")
dev.off()

data <- read.table("./Graphing/household_power_consumption.txt",sep=";",header = TRUE)
sel <- dmy(data$Date) == ymd("2007-02-02") | dmy(data$Date) == ymd("2007-02-01")
ref_data <-  data[sel,]
ref_data["DateTime"] <- as.factor(as.POSIXlt(paste(dmy(ref_data$Date),ref_data$Time),format="%Y-%m-%d %H:%M:%S"))
png("Plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
with(ref_data,plot(as.POSIXct(DateTime), as.numeric(as.character(Global_active_power)),"l",xlab = "",ylab = "Global Active Power ( killowatts )"))


with(ref_data,plot(as.POSIXct(DateTime), as.numeric(as.character(Voltage)),"l",xlab = "",ylab = "Voltage"))

with(ref_data,plot(as.POSIXct(DateTime), as.numeric(as.character(Sub_metering_1)),"l",xlab = "",ylab = "Energy Sub Metering"))
lines(as.POSIXct(ref_data$DateTime), as.numeric(as.character(ref_data$Sub_metering_2)),type = "l",col="red")
lines(as.POSIXct(ref_data$DateTime), as.numeric(as.character(ref_data$Sub_metering_3)),type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n",cex=1)

with(ref_data,plot(as.POSIXct(DateTime), as.numeric(as.character(Global_reactive_power)),"l",xlab = "",ylab = "Global Reactive Power ( killowatts )"))

dev.off()

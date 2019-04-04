data <- read.table("./Graphing/household_power_consumption.txt",sep=";",header = TRUE)
sel <- dmy(data$Date) == ymd("2007-02-02") | dmy(data$Date) == ymd("2007-02-01")
ref_data <-  data[sel,]
ref_data["DateTime"] <- as.factor(as.POSIXlt(paste(dmy(ref_data$Date),ref_data$Time),format="%Y-%m-%d %H:%M:%S"))
png("Plot2.png",width = 480,height = 480)
with(ref_data,plot(as.POSIXct(DateTime), as.numeric(as.character(Global_active_power)),"l",xlab = "",ylab = "Global Active Power ( killowatts )"))
dev.off()
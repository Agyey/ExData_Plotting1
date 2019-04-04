data <- read.table("./Graphing/household_power_consumption.txt",sep=";",header = TRUE)
sel <- dmy(data$Date) == ymd("2007-02-02") | dmy(data$Date) == ymd("2007-02-01")
ref_data <-  data[sel,]
png("Plot1.png",width = 480,height = 480)
hist(as.numeric(as.character(ref_data$Global_active_power)),col="red",main="Golbal Active Power",xlab = "Global Active Power ( killowatts )",freq = TRUE)
dev.off()
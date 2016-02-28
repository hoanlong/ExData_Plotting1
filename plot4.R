## Plot 4

if (!file.exists("01_RawData")) {dir.create("01_RawData")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./01_RawData/household_power_consumption.zip")
dateDownloaded <- date()
list.files("./01_RawData")
unzip("./01_RawData/household_power_consumption.zip", exdir = "./01_RawData")

rawdatafile <- "./01_RawData/household_power_consumption.txt"
rawdata <- read.table(rawdatafile, header = TRUE, na.strings = "?",sep = ";")
subset_1 <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot4.png", width = 480, height = 480)

datetime <- strptime(paste(subset_1$Date, subset_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subset_2_gap <- as.numeric(subset_1$Global_active_power)

subset_3_sm1 <- as.numeric(subset_1$Sub_metering_1)
subset_4_sm2 <- as.numeric(subset_1$Sub_metering_2)
subset_5_sm3 <- as.numeric(subset_1$Sub_metering_3)

subset_6_voltage <- as.numeric(subset_1$Voltage)
subset_7_grp <- as.numeric(subset_1$Global_reactive_power)

par(mfrow = c(2, 2))
plot(datetime, subset_2_gap, type="l", xlab="", ylab="Global Active Power")
plot(datetime, subset_6_voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subset_3_sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subset_4_sm2, type="l", col="red")
lines(datetime, subset_5_sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, subset_7_grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

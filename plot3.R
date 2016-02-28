## Plot 3

if (!file.exists("01_RawData")) {dir.create("01_RawData")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./01_RawData/household_power_consumption.zip")
dateDownloaded <- date()
list.files("./01_RawData")
unzip("./01_RawData/household_power_consumption.zip", exdir = "./01_RawData")

rawdatafile <- "./01_RawData/household_power_consumption.txt"
rawdata <- read.table(rawdatafile, header = TRUE, na.strings = "?",sep = ";")
subset_1 <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot3.png", width = 480, height = 480)

datetime <- strptime(paste(subset_1$Date, subset_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_2_sm1 <- as.numeric(subset_1$Sub_metering_1)
subset_3_sm2 <- as.numeric(subset_1$Sub_metering_2)
subset_4_sm3 <- as.numeric(subset_1$Sub_metering_3)

plot(datetime, subset_2_sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subset_3_sm2, type="l", col="red")
lines(datetime, subset_4_sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

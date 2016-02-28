## Plot 2

if (!file.exists("01_RawData")) {dir.create("01_RawData")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./01_RawData/household_power_consumption.zip")
dateDownloaded <- date()
list.files("./01_RawData")
unzip("./01_RawData/household_power_consumption.zip", exdir = "./01_RawData")

rawdatafile <- "./01_RawData/household_power_consumption.txt"
rawdata <- read.table(rawdatafile, header = TRUE, na.strings = "?",sep = ";")
subset_1 <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot2.png", width = 480, height = 480)
datetime <- strptime(paste(subset_1$Date, subset_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subset_2_gap <- as.numeric(subset_1$Global_active_power)
plot(datetime, subset_2_gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
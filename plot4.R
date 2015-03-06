library(lubridate)

# Import unzipped file downloaded from URL in README
hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", quote="", na.strings="?", stringsAsFactors = F)

# Subset data for dates of interest and add variable of date and time both converted to "POSIXct"
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- dmy_hms(hpc$DateTime)

# Plot multiple line graphs together and export as PNG
png("plot4.png")

par(mfrow = c(2, 2))

plot(hpc$DateTime, hpc$Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(hpc$DateTime, hpc$Global_active_power)

plot(hpc$DateTime, hpc$Voltage, main = "", xlab = "datetime", ylab = "Voltage", type = "n")
lines(hpc$DateTime, hpc$Voltage)

plot(hpc$DateTime, hpc$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "_")
lines(hpc$DateTime, hpc$Sub_metering_1)
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")

plot(hpc$DateTime, hpc$Global_reactive_power, main = "", xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(hpc$DateTime, hpc$Global_reactive_power)

dev.off()

library(lubridate)

# Import unzipped file downloaded from URL in README
hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", quote="", na.strings="?", stringsAsFactors = F)

# Subset data for dates of interest and add variable of date and time both converted to "POSIXct"
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- dmy_hms(hpc$DateTime)

# Plot line graph and export as PNG
png("plot2.png")

plot(hpc$DateTime, hpc$Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(hpc$DateTime, hpc$Global_active_power)

dev.off()

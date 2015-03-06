library(lubridate)

# Import unzipped file downloaded from URL in README
hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", quote="", na.strings="?", stringsAsFactors = F)

# Subset data for dates of interest and add variable of date and time both converted to "POSIXct"
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007", ]

hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- dmy_hms(hpc$DateTime)

# Plot histogram and export as PNG
png("plot1.png")

hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

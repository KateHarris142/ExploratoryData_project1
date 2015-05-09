#x11()
png(file="plot2.png",bg="white")

dat <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

### subset only dates feb 1st and 2nd 2007
dat2 <- rbind(dat[(dat$Dat == "1/2/2007"),],dat[(dat$Date == "2/2/2007"),])

### convert dates into usable formats and create new column
dates <- as.Date(as.character(dat2$Date),"%d/%m/%Y")
times <- as.character(dat2$Time)
X <- paste(dates,time)
full_date <- strptime(X,"%Y-%m-%d %H:%M:%S")

GAP <- dat2$Global_active_power

### plot
plot(full_date,GAP,pch=".",xlab="",ylab="Global Active Power (kilowatts)")
lines(full_date,GAP)

dev.off()
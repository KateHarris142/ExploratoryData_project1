#x11()
png(file="plot4.png",bg="white")

dat <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

### subset only dates feb 1st and 2nd 2007
dat2 <- rbind(dat[(dat$Dat == "1/2/2007"),],dat[(dat$Date == "2/2/2007"),])
GAP <- dat2[,3]

### convert dates into usable formats and create new column
dates <- as.Date(as.character(dat2$Date),"%d/%m/%Y")
times <- as.character(dat2$Time)
X <- paste(dates,time)
full_date <- strptime(X,"%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

###plots top left
plot(full_date,GAP,pch=".",xlab="",ylab="Global Active Power")
lines(full_date,GAP)

###plots top right
volts <- dat2$Voltage

plot(full_date,volts,pch=".",xlab="datetime",ylab="Voltage")
lines(full_date,volts)


### plots bottom left plot
ESM_1 <- dat2$Sub_metering_1
ESM_2 <- dat2$Sub_metering_2
ESM_3 <- dat2$Sub_metering_3


plot(full_date,ESM_1,pch=".",xlab="",ylab="Energy sub metering")
lines(full_date,ESM_1,col="black")

points(full_date,ESM_2,pch=".",col="red")
lines(full_date,ESM_2,col="red")

points(full_date,ESM_3,pch=".",col="blue")
lines(full_date,ESM_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1),bty="n")

###plots bottom right

GRP <- dat2$Global_reactive_power

plot(full_date,GRP,pch=".",xlab="datetime",ylab="Global_reactive_power")
lines(full_date,GRP)

dev.off()
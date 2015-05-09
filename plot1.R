#x11()
png(file="plot1.png",bg="white")

dat <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

### subset only dates feb 1st and 2nd 2007
dat2 <- rbind(dat[(dat$Dat == "1/2/2007"),],dat[(dat$Date == "2/2/2007"),])

#select the gloabl active power column
GAP <- dat2[,3]

#plot
hist(GAP,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)")

dev.off()
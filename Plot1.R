hpc<-read.table('./data/household_power_consumption.txt',header=TRUE,sep=';',
                'na.strings'='?')
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time<-hms::as.hms(hpc$Time)
hpc_subset<-subset(hpc,Date=='2007-02-01'&Date=='2007-02-01')
png('plot1.png')
with(hpc_subset,hist(Global_active_power,col='red',
                     xlab='Global Active Power (kilowatts)',
                     main='Global Active Power'))
dev.off()
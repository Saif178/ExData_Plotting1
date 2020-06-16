hpc<-read.table('./data/household_power_consumption.txt',header=TRUE,sep=';',
                'na.strings'='?')
datetime<-strptime(paste(hpc$Date, hpc$Time, sep=" "),
                   "%d/%m/%Y %H:%M:%S")
hpc<-cbind(hpc,datetime)
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time<-format(hpc$Time,format='%H:%M:%S')
hpc_subset<-subset(hpc,Date=='2007-02-01'|Date=='2007-02-02')
png('Plot3.png')
with(hpc_subset,plot(datetime,Sub_metering_1,
                     type='l',ylab='Energy sub metering',xlab=''))
lines(hpc_subset$datetime,hpc_subset$Sub_metering_2,col='red')
lines(hpc_subset$datetime,hpc_subset$Sub_metering_3,col='blue')
legend('topright',col=c('black','red','blue'),lty=c(1,1,1),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
hpc<-read.table('./data/household_power_consumption.txt',header=TRUE,sep=';',
                'na.strings'='?')
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time<-hms::as.hms(hpc$Time)
hpc_subset<-subset(hpc,Date=='2007-02-01')
hpc_subset_1<-subset(hpc,Date=='2007-02-02')
hpc_subset<-rbind(hpc_subset,hpc_subset_1)
png('Plot3.png')
with(hpc_subset,plot(strptime(Time,'%H:%M:%S'),Sub_metering_1,
                     type='l',ylab='Energy sub metering',xlab=''))
lines(strptime(hpc_subset$Time,'%H:%M:%S'),hpc_subset$Sub_metering_2,col='red')
lines(strptime(hpc_subset$Time,'%H:%M:%S'),hpc_subset$Sub_metering_3,col='blue')
legend('topright',col=c('black','red','blue'),lty=c(1,1,1),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
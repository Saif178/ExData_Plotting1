hpc<-read.table('./data/household_power_consumption.txt',header=TRUE,sep=';',
                'na.strings'='?')
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time<-hms::as.hms(hpc$Time)
hpc_subset<-subset(hpc,Date=='2007-02-01')
hpc_subset_1<-subset(hpc,Date=='2007-02-02')
hpc_subset<-rbind(hpc_subset,hpc_subset_1)
png('plot2.png')
with(hpc_subset,plot(strptime(Time,'%H:%M:%S'),Global_active_power,
                     type='l',ylab='Global Active Power (kilowatts)',xlab=''))
dev.off()
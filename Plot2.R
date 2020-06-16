hpc<-read.table('./data/household_power_consumption.txt',header=TRUE,sep=';',
                'na.strings'='?')
datetime<-strptime(paste(hpc$Date, hpc$Time, sep=" "),
                   "%d/%m/%Y %H:%M:%S")
hpc<-cbind(hpc,datetime)
hpc$Date<-as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time<-format(hpc$Time,format='%H:%M:%S')
hpc_subset<-subset(hpc,Date=='2007-02-01'|Date=='2007-02-02')
png('plot2.png')
with(hpc_subset,plot(datetime,Global_active_power,
                     type='l',ylab='Global Active Power (kilowatts)',xlab=''))
dev.off()
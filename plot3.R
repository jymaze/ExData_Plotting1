df<-read.table('exdata-data-household_power_consumption/household_power_consumption.txt',
               na.strings ='?', #Set missing value string
               stringsAsFactors=FALSE, #Avoid conversion of Date and Time columns to factors
               header=TRUE,
               sep=';') #Set the appropriate separator
df<-df[(df[,'Date']=='1/2/2007' | df[,'Date']=='2/2/2007'),] #Keep dates of interest
df[,'Time']<-paste(df[,'Date'],df[,'Time']) #Combine Date and Time columns
df[,'Date']<-NULL #Remove Date column
df[,'Posix']<-as.POSIXct(strptime(df[,'Time'],format='%d/%m/%Y %H:%M:%S')) #To POSIXct
########
png("plot3.png", width=480, height=480, antialias='cleartype') #Call png
plot(df$Posix,df$Sub_metering_1,
     type='l', #Line type
     ylab='Energy Sub metering', #Set x label
     xlab='', #Set y label
     )
lines(df$Posix,df$Sub_metering_2, #Add second line
      col='red' #Color red
      )
lines(df$Posix,df$Sub_metering_3, #Add third line
      col='blue' #Color blue
      )
legend('topright', #Add legend
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=1,
       col=c('black','red','blue'),
       )
dev.off() #Close device

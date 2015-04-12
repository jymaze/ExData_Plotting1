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
png("plot2.png", width=480, height=480, antialias='cleartype') #Call png
plot(df$Posix,df$Global_active_power,
     type='l', #Line type
     ylab='Global Active Power (kilowatts)', #Set x label
     xlab='', #Set y label
     )
dev.off() #Close device
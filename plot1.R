df<-read.table('exdata-data-household_power_consumption/household_power_consumption.txt',
               na.strings ='?', #Set missing value string
               stringsAsFactors=FALSE, #Avoid conversion of Date and Time columns to factors
               header=TRUE,
               sep=';') #Set the appropriate separator
df<-df[(df[,'Date']=='1/2/2007' | df[,'Date']=='2/2/2007'),] #Keep dates of interest
########
png("plot1.png", width=480, height=480, antialias='cleartype') #Call png
hist(df[,'Global_active_power'],
     main='Global Active Power', #Set main title
     col='red', #Red bars
     xlab='Global Active Power (kilowatts)', #Set x label
     )
dev.off() #Close device
# Load the data
data<-read.delim(file = "C://Users//sjoer//Documents//R//Project_Sjoerd//Coursera - Exploratory Data Analysis//Data//exdata_data_household_power_consumption//household_power_consumption.txt", header = TRUE, sep = ";", dec=".")

# Only keep observations of 01/02/2017 and 02/02/2017
data<-data[which(data$Date == "1/2/2007" | data$Date =="2/2/2007"),] 

# Convert the Date and Time variables to Date/Time classes
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
data$DateTime<-paste(data$Date, data$Time)
library(lubridate)
data$DateTime<-dmy_hms(data$DateTime)

# Graph 3

png(filename = "plot3.png", width = 480, height = 480)

# Convert sub_metering variables to numeric classes.
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))

library(tidyr)
data<-gather(data, key = "submetering_no", value="submetering_value", -c(Date:Global_intensity, DateTime))

# Create subsets based on submeter type
no1=subset(data, submetering_no="Sub_metering_1")
no2=subset(data, submetering_no="Sub_metering_2")
no3=subset(data, submetering_no="Sub_metering_3")

# Add data from the different submeters, one by one, to the graph
with(data, plot(DateTime,submetering_value, type="n", xlab="", ylab="Energy sub metering"))
with(data, points(DateTime[submetering_no=="Sub_metering_1"],submetering_value[submetering_no=="Sub_metering_1"], type = 'l'))
with(data, points(DateTime[submetering_no=="Sub_metering_2"],submetering_value[submetering_no=="Sub_metering_2"], type = 'l', col="red"))
with(data, points(DateTime[submetering_no=="Sub_metering_3"],submetering_value[submetering_no=="Sub_metering_3"], type = 'l', col="blue"))

#Create legend
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
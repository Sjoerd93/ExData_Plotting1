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

# Graph 1

# Convert Global_active_power to numeric type
data$Global_active_power=as.numeric(as.character(data$Global_active_power))

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="red", main = "Global Axis Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()
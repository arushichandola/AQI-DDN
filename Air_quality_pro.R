library(openair)
library(ggplot2)
library(xts)
library(dplyr)
library(lubridate)


nar = read.csv('Air_quality_DDN.csv',header=T,sep=",")
head(nar)

nar$date <- as.POSIXct(nar$Timestamp, format="%d-%m-%Y %H:%M", tz = "GMT")
head(nar)

# nar$date <- as.POSIXct(nar$Timestamp, format="%d-%m-%Y")
#head(nar)

summaryPlot(nar, type="density",
            avg.time="hour", col.trend="black")

timePlot(nar, pollutant = c( "PM2.5", "PM10", "Ozone" ), avg.time = "day",statistic = "mean",plot.type="l",
         cols = "blue")
timePlot(nar, pollutant = "Ozone", avg.time = "day",statistic = "mean",plot.type="l",
         cols = "blue")

timeVariation(nar, pollutant="PM2.5")

plot(timeVariation(nar, pollutant = 'PM10'),
     subset = 'hour')

plot(timeVariation(nar, pollutant = 'CO'),
     subset = 'month')

scatterPlot(nar,x="PM10",y="PM2.5",z="wd", type="season")

scatterPlot(nar,x="NO2",y="Ozone")

calendarPlot(nar,pollutant ="Ozone" )

smoothTrend(nar, pollutant = "CO", plot.type = "h", ylab = "PM2.5 (ug/m3)")

trendLevel(nar, pollutant = "Ozone",  x = "month",
           y = "hour",  type = "year",  rotate.axis = c(90, 0),
           n.levels = c(10, 10, 4),  limits = c(0, 400),
           cols = "default",  auto.text = TRUE)

windRose(aushi, ws="ws", wd="wd", paddle = "F", type="season")

polarPlot(nar, pollutant ="NO2", type="season")

timePlot(nar,pollutant = c("PM2.5","PM10"), avg.time = "day", data.thresh = 0, statistic ="mean",
         smooth = TRUE, y.relation ="free",ylab = " ", key = TRUE,
         name.pol = c("PM2.5", "PM10"), date.breaks = 12)


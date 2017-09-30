# Reading data

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

library('data.table')
library('ggplot2')

datasetread <- data.table(nei)

baltimore <- subset(datasetread, fips == '24510')

#Taking year and emissions data seperately for plotting purpose
yearwise <- baltimore[, list(emissions=sum(Emissions)), by=c('year', 'type')]
yearwise$year = as.numeric(as.character(yearwise$year))
yearwise$emissions = as.numeric(as.character(yearwise$emissions))

#using ggplot which is handy to represent complex represention
ggplot(data=yearwise, aes(x=year, y=emissions, col=type)) + geom_line() + geom_point() + ggtitle(" Baltimore City Emisions")

#Saving and writing  plot3 png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

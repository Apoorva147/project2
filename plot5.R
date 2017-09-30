# Reading data

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

library('data.table')
library('ggplot2')

datasetread <- data.table(nei)

# filter dataset to only include Baltimore with type equal to onroad
baltimore <- subset(datasetread, fips == '24510' & type == 'ON-ROAD')

yearwise <- baltimore[, list(emissions=sum(Emissions)), by=c('year', 'type')]
yearwise$year = as.numeric(as.character(yearwise$year))
yearwise$emissions = as.numeric(as.character(yearwise$emissions))

#using ggplot which is handy to represent complex represention
ggplot(data=yearwise, aes(x=year, y=emissions)) + geom_line() + geom_point() + ggtitle("Emissions in Baltimore City from Motor Vehicles")

#Saving and writing  plot5 png
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()

# Reading data

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

library('data.table')
library('ggplot2')

datasetread <- data.table(nei)

# filter dataset to only include Baltimore with type equal to on road
data <- subset(datasetread, fips %in% c('06037', '24510') & type == 'ON-ROAD')

yearwise <- data[, list(emissions=sum(Emissions)), by=c('year', 'fips')]
yearwise$year = as.numeric(as.character(yearwise$year))
yearwise$emissions = as.numeric(as.character(yearwise$emissions))

#using ggplot which is handy to represent complex represention
ggplot(data=yearwise, aes(x=year, y=emissions, col=fips)) + geom_line() + geom_point() + ggtitle("Emissions from Motor Vehicles in Baltimore City compared to Los Angeles")

#Saving and writing  plot5 png
dev.copy(png, file="plot6.png", width=480, height=480)
dev.off()
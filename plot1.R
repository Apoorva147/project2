# Reading data

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

library('data.table')
datasetread <- data.table(nei)

#Taking year and emissions data seperately for plotting purpose
yearwise <- datasetread[, list(emissions=sum(Emissions)), by=year]
yearwise$year = as.numeric(as.character(yearwise$year))
yearwise$emissions = as.numeric(as.character(yearwise$emissions))

plot(yearwise$year, yearwise$emissions, type='l', ylab='Emissions', xlab='Year')

#Saving and writing  plot1 png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


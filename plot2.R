# Reading data

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

library('data.table')

datasetread <- data.table(nei)

baltimore <- subset(datasetread, fips == '24510')

#Taking year and emissions data seperately for plotting purpose
yearwise <- baltimore[, list(emissions=sum(Emissions)), by=year]
yearwise$year = as.numeric(as.character(yearwise$year))
yearwise$emissions = as.numeric(as.character(yearwise$emissions))

plot(by_year$year, by_year$emissions, type='l', ylab='Emissions', xlab='Year')

#Saving and writing  plot2 png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()



# Reading data

# Reading data

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

library('data.table')
library('ggplot2')

# get all coal related data by merging data and classification code
mergedata <- merge(nei, scc, by="SCC")

datasetread <- data.table(mergedata)

# Filter records to those which contains the word 'coal'
coal <- grepl("coal", datasetread$Short.Name, ignore.case=TRUE)
coal <- data.table(mergedata[coal, ])

yearwise <- coal[, list(emissions=sum(Emissions)), by=c('year')]
yearwise$year = as.numeric(as.character(yearwise$year))
yearwise$emissions = as.numeric(as.character(yearwise$emissions))

#using ggplot which is handy to represent complex represention
ggplot(data=yearwise, aes(x=year, y=emissions)) + geom_line() + geom_point() + ggtitle("Coal Source Emissions in the US")

#Saving and writing  plot4 png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
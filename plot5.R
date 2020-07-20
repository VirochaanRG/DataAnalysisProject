library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)

balNEI <- subset(NEI, fips == "24510")
balNEIV <- subset(balNEI, type == "ON-ROAD")

df1 <- subset(balNEIV, year == years[1])
df2 <- subset(balNEIV, year == years[2])
df3 <- subset(balNEIV, year == years[3])
df4 <- subset(balNEIV, year == years[4])

v1 <- c(sum(df1$Emissions), sum(df2$Emissions), sum(df3$Emissions), sum(df4$Emissions))

qplot(as.character(years), v1, xlab = "Years", ylab = expression("Total Emissions of PM"[2.5]* "from motor vehicles")) + geom_bar(stat = "identity")

dev.print(png, file = "plot5.png", width = 480, height = 480)
dev.off()

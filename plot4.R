library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grep("Coal", SCC$EI.Sector)
SCCcoal <- SCC$SCC[coal]
SCCcoal <- as.vector(SCCcoal)

inter <- NEI$SCC %in% SCCcoal

coalNEI <- NEI[inter,]

years <- unique(NEI$year)

df1 <- subset(coalNEI, year == years[1])
df2 <- subset(coalNEI, year == years[2])
df3 <- subset(coalNEI, year == years[3])
df4 <- subset(coalNEI, year == years[4])

v1 <- c(sum(df1$Emissions), sum(df2$Emissions), sum(df3$Emissions), sum(df4$Emissions))

qplot(as.character(years), v1, xlab = "Years", ylab = expression("Total Emissions of PM"[2.5]* "from coal")) + geom_bar(stat = "identity")

dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()



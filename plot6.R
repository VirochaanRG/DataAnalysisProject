library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- rep(unique(NEI$year), 2)

balNEI <- subset(NEI, fips == "24510")
balNEIV <- subset(balNEI, type == "ON-ROAD")
laNEI <- subset(NEI, fips == "06037")
laNEIV <- subset(laNEI, type == "ON-ROAD")

Bdf1 <- subset(balNEIV, year == years[1])
Bdf2 <- subset(balNEIV, year == years[2])
Bdf3 <- subset(balNEIV, year == years[3])
Bdf4 <- subset(balNEIV, year == years[4])

Ldf1 <- subset(laNEIV, year == years[1])
Ldf2 <- subset(laNEIV, year == years[2])
Ldf3 <- subset(laNEIV, year == years[3])
Ldf4 <- subset(laNEIV, year == years[4])

Cities <- rep(c("Baltimore", "Los Angeles"), times= c(4,4)) 

v1 <- c(sum(Bdf1$Emissions), sum(Bdf2$Emissions), sum(Bdf3$Emissions), sum(Bdf4$Emissions)
        ,sum(Ldf1$Emissions), sum(Ldf2$Emissions), sum(Ldf3$Emissions), sum(Ldf4$Emissions) )
v1 <- as.numeric(v1)
finaldf <- data.frame(v1,Cities,years)

g <- ggplot(finaldf, aes(x = years, y = as.numeric(v1)))
g + geom_bar(stat = "identity") + facet_grid(Cities~., scales ="free") + labs(y = expression("Total Emissions of PM"[2.5]* "from motor vehicle sources", x = "Year"))


dev.print(png, file = "plot6.png", width = 720, height = 480)
dev.off()

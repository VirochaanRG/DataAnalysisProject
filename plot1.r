NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- unique(NEI$year)



df1 <- subset(NEI, year == years[1])
df2 <- subset(NEI, year == years[2])
df3 <- subset(NEI, year == years[3])
df4 <- subset(NEI, year == years[4])

v1 <- c(sum(df1$Emissions), sum(df2$Emissions), sum(df3$Emissions), sum(df4$Emissions))
barplot(v1, main = expression("Total Emissions of PM"[2.5]* "from 1999 to 2008"), names.arg = years, 
        xlab = "Years", ylab = expression("Total PM"[2.5]* "Emissions"))

dev.print(png, file = "plot1.png", width = 480, height = 480)
dev.off()

 

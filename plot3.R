library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

types <- unique(NEI$type)
years <- unique(NEI$year)

balNEI <- subset(NEI, fips == "24510")

df1 <- subset(balNEI, type == types[1])
df2 <- subset(balNEI, type == types[2])
df3 <- subset(balNEI, type == types[3])
df4 <- subset(balNEI, type == types[4])


y <- c("Sum", "Type", "Year")
finaldf <- data.frame()


sums <- c()
types2 <- c()
year2 <- c()

for(i in 1:4){
    for(j in 1:length(years)){
        if(i == 1){
            x <- subset(df1, year == years[j])
            sums[length(sums) + 1] <- sum(x$Emissions)
            types2[length(types2) + 1] <- x$type[1]
            year2[length(year2) + 1] <- years[j]
            x <- c()
        }
        if(i == 2){
            x <- subset(df2, year == years[j])
            sums[length(sums) + 1] <- sum(x$Emissions)
            types2[length(types2) + 1] <- x$type[1]
            year2[length(year2) + 1] <- years[j]
            x <- c()
        }
        if(i == 3){
            x <- subset(df3, year == years[j])
            sums[length(sums) + 1] <- sum(x$Emissions)
            types2[length(types2) + 1] <- x$type[1]
            year2[length(year2) + 1] <- years[j]
            x <- c()
        }
        if(i == 4){
            x <- subset(df4, year == years[j])
            sums[length(sums) + 1] <- sum(x$Emissions)
            types2[length(types2) + 1] <- x$type[1]
            year2[length(year2) + 1] <- years[j]
            x <- c()
        }
    }
}
df10 <- cbind(sums, types2)
df10 <- cbind(df10, year2)
finaldf <- rbind(finaldf, df10)
colnames(finaldf) <- y

g <- ggplot(finaldf, aes(x = Year, y = as.numeric(Sum)))
g + geom_bar(stat = "identity") + facet_wrap(~Type) + labs(y = "Total Emissions", x = "Year")

dev.print(png, file = "plot3.png", width = 480, height = 480)
dev.off()
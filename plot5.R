## read in emissions data and classification code
emissions_data <- readRDS("C:/Users/Microsoft/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
class_code <- readRDS("C:/Users/Microsoft/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

## subset data from Baltimore City from type "on road"
baltimore_car_data <- subset(emissions_data, emissions_data$fips=="24510" 
                             & emissions_data$type=="ON-ROAD")
baltimore_car_year <- aggregate(baltimore_car_data$Emissions, 
                                by=list(baltimore_car_data$year), FUN=sum)
colnames(baltimore_car_year) <- c("Year", "Emissions")

## create plot showing car related emissions in Baltimore City from 1999-2008
png(filename = "plot5.png")
plot(baltimore_car_year$Year, baltimore_car_year$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()
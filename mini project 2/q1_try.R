# R code for Gujrat State
#for Population Density Data:
# #source url - http://censusindia.gov.in/2011-prov-results/data_files/gujarat/statement-1.xls

library(ggplot2)
library(plyr)
library(raster)
#install.packages("rgdal")
library(rgdal)
#install.packages("rgeos")
library(rgeos)
library(ggplot2)
library(dplyr)
library(sp)
#load the csv file containing population density data
population_density <- read.csv("density.csv", sep = ",")
#fetching map of India from gadm
India <- getData("GADM", country = "India", level = 2)  
Gujarat <- subset(India, NAME_1 == "Gujarat")
#converting map of gujarat into a data matrix
map <- fortify(Gujarat);  
#casting value of id in map into integer and modifying map 
map$id <- as.integer(map$id);  
dat <- data.frame(id = 133:165, district = Gujarat@data$NAME_2);
#joining gujarat map dataframe with the provided population density data
map_df <- join(map, population_density, by ="id", type="inner")
centers <- data.frame(gCentroid(Gujarat, byid = TRUE));  
centers$state <- dat$district;  	

#plotting the map
ggplot() +
  geom_polygon(data = map_df, aes(x = long, y = lat, group = group,fill = map_df$density)) +
  geom_polygon(data = map_df, aes(x = long, y = lat, group = group),
               fill = NA, color = "black", size = 0.25) +
  scale_fill_distiller(palette = "Reds")+
  geom_text(data = centers, aes(label = state, x = x, y = y), size = 2) + coord_map() + 
  labs(x = "", y = "", title = "Districts of Gujarat")
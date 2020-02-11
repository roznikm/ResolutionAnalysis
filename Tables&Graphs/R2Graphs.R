library(tidyverse)
library(sf)
library(tigris)
library(tmap)

df <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/RegressionCorn.csv")
df <- df %>% mutate(Med_low = r2.500m  - r2.1km) 
df <- df %>% mutate(High_low = r2.250m  - r2.1km) 
df <- df %>% mutate(high_med = r2.500m  - r2.250m) 

UScounties <- counties(class='sf')
UScounties <- UScounties %>% filter(!STATEFP %in% c('02', '78', '72', '69', '66', '60', '15'))
states <- states(class='sf')
illinois_geom <- states %>% filter(STATEFP == '17')
illinois_geom <- illinois_geom$geometry

iowa <- UScounties %>% filter(STATEFP == '19')
iowa <- left_join(iowa, df)
illinois <- UScounties %>% filter(STATEFP == '17')
illinois <- left_join(illinois, df)

counties_joined_us <- left_join(UScounties, df)


# tm_shape(counties_joined_us) +  tm_borders(lwd=2) +
#   tm_fill(col='r2.1km') 

st_write(counties_joined_us, "/Users/lysaporth/Rprojects/ResolutionPaper/R2Shapfiles/CountiesCorn.shp")
st_write(iowa, "/Users/lysaporth/Rprojects/ResolutionPaper/R2Shapfiles/iowa.shp")
st_write(illinois, "/Users/lysaporth/Rprojects/ResolutionPaper/R2Shapfiles/illinois.shp")
st_write(illinois_geom, "/Users/lysaporth/Rprojects/ResolutionPaper/R2Shapfiles/illinois_geom.shp")

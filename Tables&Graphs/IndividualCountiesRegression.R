library(tidyverse)
library(stargazer)

sw250m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mSpringWheat.csv")
sw500m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mSpringWheat.csv")
sw1km <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmSpringWheat.csv")

sw250m <- sw250m %>% filter(GEOID == '38017')
sw500m <- sw500m %>% filter(GEOID == '38017')
sw1km <- sw1km %>% filter(GEOID == '38017')

mod250m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=sw250m)
mod500m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=sw500m)
mod1km <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=sw1km)

names(mod250m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod500m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod1km$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
stargazer(mod1km,mod500m, mod250m, type='latex', style='aer')

### Winter Wheat 
ww250m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mWinterWheat.csv")
ww500m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mWinterWheat.csv")
ww1km <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmWinterWheat.csv")

ww250m <- ww250m %>% filter(GEOID == '38017')
ww500m <- ww500m %>% filter(GEOID == '38017')
ww1km <- ww1km %>% filter(GEOID == '38017')

mod250m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=ww250m)
mod500m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=ww500m)
mod1km <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=ww1km)

names(mod250m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod500m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod1km$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
stargazer(mod1km,mod500m, mod250m, type='latex', style='aer')

### Corn 
corn250m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mCorn.csv")
corn500m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mCorn.csv")
corn1km <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmCorn.csv")

corn250m <- corn250m %>% filter(GEOID == '18009')
corn500m <- corn500m %>% filter(GEOID == '18009')
corn1km <- corn1km %>% filter(GEOID == '18009')

mod250m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=corn250m)
mod500m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=corn500m)
mod1km <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=corn1km)

names(mod250m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod500m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod1km$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
stargazer(mod1km,mod500m, mod250m, type='latex', style='aer')


### Soy 
soy250m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mSoy.csv")
soy500m <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mSoy.csv")
soy1km <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmSoy.csv")

soy250m <- soy250m %>% filter(GEOID == '19015')
soy500m <- soy500m %>% filter(GEOID == '19015')
soy1km <- soy1km %>% filter(GEOID == '19015')

mod250m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=soy250m)
mod500m <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=soy500m)
mod1km <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=soy1km)

names(mod250m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod500m$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
names(mod1km$coefficients) <- c("(Intercept)",  "Year", "NDVI", "NDVI^2")
stargazer(mod1km,mod500m, mod250m, type='latex', style='aer')


library(tidyverse)

### Corn 
corn1km <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmCorn.csv')
corn1km <- corn1km %>% filter(planted > 1000)
selected <- corn1km %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
corn1km <- corn1km %>% 
  filter(GEOID %in% selected$GEOID)


corn500m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi500mCorn.csv')
corn500m <- corn500m %>% filter(planted > 1000)
corn500m <- corn500m %>% filter(planted > 1000)
selected <- corn500m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
corn500m <- corn500m %>% 
  filter(GEOID %in% selected$GEOID)

corn250m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi250mCorn.csv')
corn250m <- corn250m %>% filter(planted > 1000)
selected <- corn250m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
corn250m <- corn250m %>% 
  filter(GEOID %in% selected$GEOID)

length(unique(corn1km$GEOID)) #526
length(unique(corn500m$GEOID)) #535
length(unique(corn250m$GEOID)) # 533

counties <- unique(corn1km$GEOID)

corn500m <- corn500m %>% filter(GEOID %in% counties)
corn250m <- corn250m %>% filter(GEOID %in% counties)

write_csv(corn1km, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmCorn.csv')
write_csv(corn500m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mCorn.csv')
write_csv(corn250m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mCorn.csv')

#### Soybeans 
soy1km <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmSoy.csv')
soy1km <- soy1km %>% filter(planted > 1000)
selected <- soy1km %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
soy1km <- soy1km %>% 
  filter(GEOID %in% selected$GEOID)


soy500m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi500mSoy.csv')
soy500m <- soy500m %>% filter(planted > 1000)
soy500m <- soy500m %>% filter(planted > 1000)
selected <- soy500m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
soy500m <- soy500m %>% 
  filter(GEOID %in% selected$GEOID)

soy250m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi250mSoy.csv')
soy250m <- soy250m %>% filter(planted > 1000)
selected <- soy250m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
soy250m <- soy250m %>% 
  filter(GEOID %in% selected$GEOID)

length(unique(soy1km$GEOID)) #561
length(unique(soy500m$GEOID)) #564
length(unique(soy250m$GEOID)) # 565

counties <- unique(soy1km$GEOID)

soy500m <- soy500m %>% filter(GEOID %in% counties)
soy250m <- soy250m %>% filter(GEOID %in% counties)

write_csv(soy1km, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmSoy.csv')
write_csv(soy500m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mSoy.csv')
write_csv(soy250m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mSoy.csv')

#### Winter Wheat  
ww1km <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmWinterWheat.csv')
ww1km <- ww1km %>% filter(planted > 1000)
selected <- ww1km %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
ww1km <- ww1km %>% 
  filter(GEOID %in% selected$GEOID)


ww500m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi500mWinterWheat.csv')
ww500m <- ww500m %>% filter(planted > 1000)
ww500m <- ww500m %>% filter(planted > 1000)
selected <- ww500m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
ww500m <- ww500m %>% 
  filter(GEOID %in% selected$GEOID)

ww250m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi250mWinterWheat.csv')
ww250m <- ww250m %>% filter(planted > 1000)
selected <- ww250m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
ww250m <- ww250m %>% 
  filter(GEOID %in% selected$GEOID)

length(unique(ww1km$GEOID)) #100
length(unique(ww500m$GEOID)) #118
length(unique(ww250m$GEOID)) #137

counties <- unique(ww1km$GEOID)

ww500m <- ww500m %>% filter(GEOID %in% counties)
ww250m <- ww250m %>% filter(GEOID %in% counties)

write_csv(ww1km, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmWinterWheat.csv')
write_csv(ww500m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mWinterWheat.csv')
write_csv(ww250m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mWinterWheat.csv')

#### Spring Wheat  
sw1km <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmSpringWheat.csv')
sw1km <- sw1km %>% filter(planted > 1000)
selected <- sw1km %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
sw1km <- sw1km %>% 
  filter(GEOID %in% selected$GEOID)


sw500m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi500mSpringWheat.csv')
sw500m <- sw500m %>% filter(planted > 1000)
sw500m <- sw500m %>% filter(planted > 1000)
selected <- sw500m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
sw500m <- sw500m %>% 
  filter(GEOID %in% selected$GEOID)

sw250m <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi250mSpringWheat.csv')
sw250m <- sw250m %>% filter(planted > 1000)
selected <- sw250m %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)
sw250m <- sw250m %>% 
  filter(GEOID %in% selected$GEOID)

length(unique(sw1km$GEOID)) #22
length(unique(sw500m$GEOID)) #22
length(unique(sw250m$GEOID)) #22

counties <- unique(sw1km$GEOID)

sw500m <- sw500m %>% filter(GEOID %in% counties)
sw250m <- sw250m %>% filter(GEOID %in% counties)

write_csv(sw1km, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmSpringWheat.csv')
write_csv(sw500m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mSpringWheat.csv')
write_csv(sw250m, '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mSpringWheat.csv')





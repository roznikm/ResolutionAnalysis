library('tidyverse')

file_path_read <- '/Users/lysaporth/Rprojects/ResolutionPaper/NdviYieldPlantingDateData/df1kmWinterWheat.csv'
file_path_write <- '/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmWinterWheat.csv'
df <- read_csv(file_path_read)

df$date <- as.Date(with(df, paste(Year, Month, Day,sep="-")), "%Y-%m-%d")
df <- df %>% filter(Year > 2005)
years_geoid_df <- group_split(df, Year, GEOID)

CalculateMaxNdvi = function(county_year){  
  max_ndvi <- county_year[which.max(county_year$NDVI), ]
  max_ndvi$NDVI <- max_ndvi$NDVI / 10000
  return(max_ndvi)
}

results <- map(years_geoid_df, CalculateMaxNdvi)
results <- bind_rows(results)
results <- results %>% drop_na()
selected_counties <- results %>% 
  group_by(GEOID) %>% 
  summarise(n=n()) %>% filter(n==13)

results_full_history <- results %>% 
  filter(GEOID %in% selected_counties$GEOID)

write_csv(results_full_history, file_path_write)


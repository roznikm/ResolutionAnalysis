library(tidyverse)
library(broom)

low <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmSpringWheat.csv')
med <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi500mSpringWheat.csv')
high <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi250mSpringWheat.csv')

county_df_high <- group_split(high, GEOID)
county_df_med <- group_split(med, GEOID)
county_df_low <- group_split(low, GEOID)

regression_func = function(county_df) {
    mod <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=county_df)
    x <- glance(mod)
    x$planted <- county_df$planted[1]
  return(x)
}

low_results <- lapply(county_df_low, regression_func)
low_results <- bind_rows(low_results)
low_results <- low_results %>% filter(planted > 1000)

medium_results <- lapply(county_df_med, regression_func)
medium_results <- bind_rows(medium_results)
medium_results <- medium_results %>% filter(planted > 1000)

high_results <- lapply(county_df_high, regression_func)
high_results <- bind_rows(high_results)
high_results <- high_results %>% filter(planted > 1000)

mean(low_results$r.squared)
mean(medium_results$r.squared)
mean(high_results$r.squared)

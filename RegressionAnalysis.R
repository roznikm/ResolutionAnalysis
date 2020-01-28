library(tidyverse)
library(broom)

low <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi1kmCorn.csv')
low <- low %>% filter(planted > 1000)
med <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi500mCorn.csv')
med <- med %>% filter(planted > 1000)
high <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/dfmaxndvi250mCorn.csv')
high <- high %>% filter(planted > 1000)

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

medium_results <- lapply(county_df_med, regression_func)
medium_results <- bind_rows(medium_results)

high_results <- lapply(county_df_high, regression_func)
high_results <- bind_rows(high_results)

mean(low_results$r.squared)
mean(medium_results$r.squared)
mean(high_results$r.squared)

# mod_low <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2) + as.factor(GEOID),data=low)
# x <- summary(mod_low)
# x$r.squared
# mod_med <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2) + as.factor(GEOID),data=med)
# y <- summary(mod_med)
# y$r.squared
# mod_high <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2) + as.factor(GEOID),data=high)
# z <- summary(mod_high)
# z$r.squared


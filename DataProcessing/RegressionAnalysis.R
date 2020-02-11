library(tidyverse)
library(broom)

low <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmCorn.csv')
med <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mCorn.csv')
high <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi250mCorn.csv')

county_df_high <- group_split(high, GEOID)
county_df_med <- group_split(med, GEOID)
county_df_low <- group_split(low, GEOID)

regression_func = function(county_df) {
    mod <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2),data=county_df)
    x <- glance(mod)
    x$planted <- county_df$planted[1]
    x$GEOID <- county_df$GEOID[1]
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

# Combine Results 
low_res <- low_results %>% select(r.squared, GEOID)
names(low_res) <- c('r2.1km', 'GEOID')
med_res <- medium_results %>% select(r.squared, GEOID)
names(med_res) <- c('r2.500m', 'GEOID')
high_res <- high_results %>% select(r.squared, GEOID)
names(high_res) <- c('r2.250m', 'GEOID')

inter_df <- left_join(low_res, med_res)
finished_df <- left_join(inter_df, high_res)
write_csv(finished_df, "/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/CornRegression.csv")
# mod_low <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2) + as.factor(GEOID),data=low)
# x <- summary(mod_low)
# x$r.squared
# mod_med <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2) + as.factor(GEOID),data=med)
# y <- summary(mod_med)
# y$r.squared
# mod_high <- lm(yield ~ I(Year - 2005) + NDVI + I(NDVI^2) + as.factor(GEOID),data=high)
# z <- summary(mod_high)
# z$r.squared


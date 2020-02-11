
library(xtable)
library(tidyverse)

summaryfunction= function (x){
  if( is.numeric(x)!=TRUE) {stop("Supplied X is not numeric")}
  mysummary = data.frame(
    "Min." =as.numeric( min(x)),
    "1st Qu." = quantile(x)[2],
    "Median" = median(x),
    "Mean" = mean(x),
    "3rd Qu." = quantile(x)[4],
    "Max." = max(x),
    row.names=""
    
  )
  names(mysummary) = c("Min.","1st Qu.","Median","Mean","3rd Qu.","Max.")
  return( mysummary )
}
######## Yield Descriptives 
corn <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi1kmCorn.csv')
## Number of Counties 536
length(unique(corn$GEOID))
names(corn)[2] <- 'Corn Yield'
w <- summaryfunction(corn$`Corn Yield`)

soy <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mSoy.csv')
length(unique(soy$GEOID))
names(soy)[2] <- 'Soybean Yield'
x <- summaryfunction(soy$`Soybean Yield`)

sw <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mSpringWheat.csv')
length(unique(sw$GEOID))
names(sw)[2] <- 'Spring Wheat Yield'
y <- summaryfunction(sw$`Spring Wheat Yield`)

ww <- read_csv('/Users/lysaporth/Rprojects/ResolutionPaper/MaxNDVIdfs/Clean_dfmaxndvi500mWinterWheat.csv')
length(unique(ww$GEOID))
names(ww)[2] <- 'Winter Wheat Yield'
summary(ww)

z <- summaryfunction(ww$`Winter Wheat Yield`)

tab <- bind_rows(w,x,y,z)
xtable(tab)


# r2df <- tibble(`spring wheat` =c(0.5115, 0.5674, 0.5786),
#                `winter wheat`=c(0.4181,0.4294,0.4495),
#                corn = c(0.7339, 0.7503,0.7563),
#                soybeans = c(0.7102, 0.7224, 0.7328))
# 
# ave <- rowMeans(r2df)
# df <- tibble(R2 = ave, Resolution = c(1000, 500, 250))
# 
# p1 <- ggplot(df, aes(y = R2, x = Resolution)) + 
#       scale_x_reverse(breaks = c(1000, 500, 250)) + 
#       geom_point(size=4, alpha=0.5) +
#       geom_line(linetype = 'solid') + 
#       ylim(0.5, 0.7) + xlab('NDVI Resolution in Meters')
# 
# p1 <- p1 + geom_curve(aes(y=0.593, yend =0.617, x=1000, xend =500), 
#                 data=df,
#                linetype = 'dashed')
# 
# p1 <- p1 + geom_curve(aes(y=0.617, yend =0.629, x=500, xend =250), 
#                       data=df,
#                       linetype = 'dashed')
# 
# p1 <- p1 + annotate(
#       geom = 'text', x=750, y = 0.54, label = 'R2 Change of 0.024'
#     )
# p1 <- p1 + annotate(
#   geom = 'text', x=350, y = 0.58, label = 'R2 Change of 0.012'
# )
# 
# fp <- '/Users/lysaporth/Documents/SpatialTemporalRes/ArticleSeptember/AverageChange.png'
# ggsave(p1, filename = fp)
  
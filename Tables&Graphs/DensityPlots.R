library(tidyverse)
library(gridExtra)

corn <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/CornRegression.csv")
names(corn) <- c('1km','GEOID', '500m', '250m')
##Plots
df_plot <- corn %>% select('250m' ,"1km")
df_long <- gather(df_plot)
names(df_long) <- c('Resolution', 'R2')
p1 <- ggplot(df_long, aes(x=R2, fill = Resolution, linetype=Resolution)) + geom_density( alpha=0.05)+
  scale_linetype_manual(values=c("twodash", "dotted", "solid", "dashed")) + 
  xlab("R2") +ylab("Density") + ggtitle('A. Corn') + theme_bw()
p1

soy <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/SoybeanRegression.csv")
names(soy) <- c('1km','GEOID', '500m', '250m')
##Plots
df_plot <- soy %>% select('250m' ,"1km")
df_long <- gather(df_plot)
names(df_long) <- c('Resolution', 'R2')
p2 <- ggplot(df_long, aes(x=R2, fill = Resolution, linetype=Resolution)) + geom_density( alpha=0.05)+
  scale_linetype_manual(values=c("twodash", "dotted", "solid", "dashed")) + 
  xlab("R2") +ylab("Density") + ggtitle('B. Soybeans') + theme_bw()
p2


ggsave('/Users/lysaporth/Rprojects/ResolutionPaper/CornSoy.png', arrangeGrob(p1, p2,ncol=2))

### Wheat Graph
sw <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/SpringWheatRegression.csv")
names(sw) <- c('1km','GEOID', '500m', '250m')
##Plots
df_plot <- sw %>% select('250m' ,"1km")
df_long <- gather(df_plot)
names(df_long) <- c('Resolution', 'R2')
p1 <- ggplot(df_long, aes(x=R2, fill = Resolution, linetype=Resolution)) + geom_density( alpha=0.05)+
  scale_linetype_manual(values=c("twodash", "dotted", "solid", "dashed")) + 
  xlab("R2") +ylab("Density") + ggtitle('A. Spring Wheat') + theme_bw()
p1

ww <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/WinterWheatRegression.csv")
names(ww) <- c('1km','GEOID', '500m', '250m')
##Plots
df_plot <- ww %>% select('250m' ,"1km")
df_long <- gather(df_plot)
names(df_long) <- c('Resolution', 'R2')
p2 <- ggplot(df_long, aes(x=R2, fill = Resolution, linetype=Resolution)) + geom_density( alpha=0.05)+
  scale_linetype_manual(values=c("twodash", "dotted", "solid", "dashed")) + 
  xlab("R2") +ylab("Density") + ggtitle('B. WinterWheat') + theme_bw()
p2


ggsave('/Users/lysaporth/Rprojects/ResolutionPaper/WinterSpring.png', arrangeGrob(p1, p2,ncol=2))



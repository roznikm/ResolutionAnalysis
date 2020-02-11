library(tidyverse)

corn <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/CornRegression.csv")
## Corn t.test
t.test(corn$r2.250m,corn$r2.1km, alternative="greater", var.equal = TRUE)
t.test(corn$r2.250m,corn$r2.500m, alternative="greater", var.equal = TRUE)
t.test(corn$r2.500m,corn$r2.1km, alternative="greater", var.equal = TRUE)

soybean <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/SoyRegression.csv")
## Soybeans t.test
t.test(soybean$r2.250m,soybean$r2.1km, alternative="greater", var.equal = TRUE)
t.test(soybean$r2.250m,soybean$r2.500m, alternative="greater", var.equal = TRUE)
t.test(soybean$r2.500m,soybean$r2.1km,  alternative="greater", var.equal = TRUE)

spring_wheat <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/SpringWheatRegression.csv")
## SpringWheat t.test
t.test(spring_wheat$r2.250m,spring_wheat$r2.1km, alternative="greater", var.equal = TRUE)
t.test(spring_wheat$r2.250m,spring_wheat$r2.500m, alternative="greater", var.equal = TRUE)
t.test(spring_wheat$r2.500m,spring_wheat$r2.1km,  alternative="greater", var.equal = TRUE)

winter_wheat <- read_csv("/Users/lysaporth/Rprojects/ResolutionPaper/RegressionResults/WinterWheatRegression.csv")

## WintergWheat t.test
t.test(winter_wheat$r2.250m,winter_wheat$r2.1km, alternative="greater", var.equal = TRUE)
t.test(winter_wheat$r2.250m,winter_wheat$r2.500m, alternative="greater", var.equal = TRUE)
t.test(winter_wheat$r2.500m,winter_wheat$r2.1km,  alternative="greater", var.equal = TRUE)



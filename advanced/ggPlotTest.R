install.packages("ggplot2")
library("ggplot2")
mydata <- c("java","spring","bigdata","android")
mydata
qplot(mydata) #그래프가 뜬다
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=hwy, y=drv)
qplot(data=mpg, x=drv, y=hwy,geom="line")
qplot(data=mpg, x=drv, y=hwy,geom="boxplot")
qplot(data=mpg, x=drv, y=hwy,geom="boxplot",colour=drv)

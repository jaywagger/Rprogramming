mydata <- read.csv("csv_exam.csv")
mydata
mydataResult <- mydata[mydata$science>=80,]
mydataResult
mydataResult[,c(3:5)]
mydataResult$mytotal <- as.numeric(mydataResult$math+mydataResult$english+mydataResult$science)
mydataResult
mydataResult$myavg <- as.numeric(mydataResult$mytotal/3)
mydataResult

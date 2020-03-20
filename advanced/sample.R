a <- sample(1:10)
a <- sample(1:10, size = 5, replace = FALSE) #false는 중복이 안된다. 
a
#데이터가 바뀌지 않도록 설정
set.seed(1221) #1222는 key값이고 여기서부터는 작업 데이터가 그대로 유지된다. 찾아갈 수 있는 key값. 변경가능능 
a <- sample(1:10, size = 5, replace = FALSE) #false는 중복이 안된다. 
a
set.seed(1222)
a
#if 문의 역할을 하는 함수 - if-else
set.seed(1221)
ifdf <- data.frame(mynum=1:6, 
                   myval=sample(c("spring","bigdata","android"),
                                           size=6,
                                           replace = TRUE))
ifdf

#myval의 값이 spring이면 프로젝트완료, bigdata면 할꺼야
for (i in 1:nrow(ifdf)) {
  if(ifdf[i,"myval"]=="spring"){
    ifdf[i,"info"] <- "프로젝트완료"
  }else{
    ifdf[i,"info"] <- "할꺼야"
  }
  
}
ifdf
#이렇게하면 편하지만 라인은 많고 속도 저하가 오기 때문에 함수로 처리한다
#test=조건 /yes= true / no=false
ifdf[,"info2"] <- ifelse(test = ifdf$myval=="spring",
                         yes="쉽다",
                         no="할꺼다")
ifdf
ifdf[,"info3"] <- ifelse(test = ifdf$myval=="spring",
                         yes="쉽다",
                         no= ifelse(test=ifdf$myval=="bigdata",
                                    yes="머신셋팅",
                                    no="device셋팅완료"))
ifdf



















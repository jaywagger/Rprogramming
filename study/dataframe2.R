#dataframe만들기 - 1. matrix를 dataframe으로 변환
#2. 벡터를 여러 개 만들어서 dataframe을 작성
eng <- c(100,99,90)
math <- c(100,99,100)
mydf1 <-  data.frame(eng,math)
mydf1
mean(mydf1$eng)
mean(mydf1$math)
#3.dataframe을 직접 정의
mydf2 <- data.frame(eng=c(100,100,100),
                    m = c(90,90,90))
mydf2
mean(mydf2$eng)

#생성이 완료되어 사용중인 matrix, dataframe의 행과 열을 변경
m <- matrix(1:15,ncol = 3,byrow = T)
m
m <- t(m)
m

d <- data.frame(m)
d
d <- t(d)
d




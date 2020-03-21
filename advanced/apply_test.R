#apply_test: apply
#filter: 데이터 정제, 이상데이터 잘라내기
#

data() #R내부에 샘플데이터를 가져오기
data(package="MASS")
library(MASS)
data("Boston")
head(Boston)
colnames(Boston)
t(colnames(Boston))
t(t(colnames(Boston)))

df <- head(Boston[,1:7])
df

#반복잡업을 할 떄 사용할 수 있도록 함수를 지원
#margin:1 => 행방향, 2: 열방향 
df[,"total"] <- apply(X=df, MARGIN =1,FUN = "sum" )
df
df[,"avg"] <- apply(X=df, MARGIN =1,FUN = "mean" )
df

round(apply(X=df,MARGIN = 2, FUN = "sum"),4)
round(apply(X=df,MARGIN = 2, FUN = "mean"),4)


#apply의 margin 속성을 2로 정의
sapply(X=df,FUN = "mean") #각 컬럼 평균균
sapply(X=df,FUN = "class") #각 컬럼 타입

#t(t()) 세로로 보기
t(t(sapply(X=df,FUN = "class")))







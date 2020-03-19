#행렬
matrix(1:15)
?matrix
mymat1 <- matrix(1:15,ncol = 3) #숫자아래로
mymat1
mymat1 <- matrix(1:15,ncol = 3,byrow = T)
                              #숫자옆으로
mymat1 #1~15
#matrix에서 원하는 값을 추출하기
mymat1[2,2]#행, 열
mymat1[3,3]#행, 열
mymat1[1,c(1:3)]#행, 열
mymat1[2,c(1:3)]#행, 열
mymat1[1,] #1행 모든 열
mymat1[,1]#모든행, 1열열

#1행과 3행 데이터
mymat1[c(1,3),]

#1행과 3행을 뺀 데이터
mymat1[-c(1,3),]

#미니실습1: 2행부터 4행까지 출력
#(단 2번 3번 열만 )
mymat1[2:4,c(2,3)]
#
cbind(mymat1,c(1,11,111,1111))
addmymat1 <- cbind(mymat1,c(1,11,111,1111))
addmymat1
#cbind는 컬럼을 추가하는 함수 - 값이 부족하면 맨 앞의 값이 채워진다. 

addmymat2 <- rbind(mymat1,c(1,11))
addmymat2
#열에 제목 추가
colnames(mymat1) <- c("a","b","c")
mymat1
#행에 제목 추가
rownames(mymat1) <- c("r1","r2","r3","r4","r5")
mymat1

mean(mymat1)

exmat <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90), nrow = 4, ncol = 4, byrow = TRUE,dimnames = list(c("kim", "lee", "hong", "jang"),c("국어", "영어", "과학", "수학")))
exmat
mean(exmat[1,1:4])
kim <- mean(exmat[1,1:4])
kim
lee <- mean(exmat[2,1:4])
lee
hong <- mean(exmat[3,1:4])
jang <- mean(exmat[4,1:4])
kim
lee
hong
jang
avg_name <- matrix(c(kim,lee,hong,jang),nrow = 1,ncol = 4)
avg_name
korean <- mean(exmat[1:4,1])
korean
english <- mean(exmat[1:4,2])
english
science <- mean(exmat[1:4,3])
science
math <- mean(exmat[1:4,4])
math
avg_subject <- matrix(c(korean,english,science,math),nrow = 1,ncol = 4)
avg_subject

exmat <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90), nrow = 4, ncol = 4, byrow = TRUE,dimnames = list(c("kim", "lee", "hong", "jang"),c("국어", "영어", "과학", "수학")))
exmat
avg_name <- matrix(c(kim,lee,hong,jang),nrow = 1,ncol = 4)
avg_name
avg_subject





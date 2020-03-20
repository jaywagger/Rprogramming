df <- data.frame(mydata1=1:5,
                 mydata2=letters[1:5],
                 mydata3=c("이민호","android","hadoop","R","한글#$%^"))

install.packages("data.table")
library("data.table")

#### 파 일write####
write.csv(df,"encoding_test.csv",row.names = FALSE)
write.csv(df,"encoding_test_euc.csv",row.names = FALSE, fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv",row.names = FALSE, fileEncoding = "cp949")
write.csv(df,"encoding_test_utf8.csv",row.names = FALSE, fileEncoding = "utf8")


####깨진파일 처리하기####
read.csv("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv")
readLines("encoding_test_utf8.csv",encoding="UTF-8")

#data.table - dataframe보다 강력
dftable <- fread("encoding_test_utf8.csv") #라이브러리 설치하여 이게 작동함함/ fread가 data.table function이다
head(dftable)

#인코딩 함수
Encoding(dftable$mydata3) = "UTF-8"
head(dftable) #잘 나옴옴 인코딩 변환 완료



####외부데이터 읽어오기####
####csv 파일 읽기####
####readLines을 이용하면 데이터가 커도 어떤 구성인지 확인할 수 있다 ####
dfimport <- readLines("01_csv.csv",n=3)
dfimport

#csv파일이므로 ,로 구분이 되어 있지만 사용자가 원하는 구분자를 적용해서 작성한 문자열인 경우 
#01_csv.csv 읽은 내용을 가공해서 데이터프레임을 작성
dfcsv <- data.frame(num=1:3,
                    mydata=dfimport, #위에 3줄만
                    stringsAsFactors = FALSE)
dfcsv
dfcsv$mydata #데이터가 ,로 구분되어 있어 나눠야한다.
strsplit(dfcsv$mydata,split = ",") #꼼마 split
strsplit(dfcsv$mydata,split = ",")[[1]] #리스트로 리턴 
strsplit(dfcsv$mydata,split = ",")[[2]] 

#리스트가 불편하니 변환하려면 라이브러리를 받아야 한다
#하나의 컬럼안에 구분자로 텍스트가 구성된 경우 분리한다.
install.packages("splitstackshape")
library("splitstackshape")
dfcsv2 <- cSplit(indt = dfcsv,
                 splitCols = "mydata",
                 sep=",")
dfcsv2 #데이터가 콜롬에 잘 나눠져서 들어갔다 

#데이터 타입변경
class(dfcsv2)

#데이터 변경
#as의 함수들을 이용해서 변경 as는 ~~~가 아닌 것을 ~~~~로 변경한다는 의미 - data.table과 data.frame의 속성을 가지고 있는 dfcsv2를 dataframe으로 변경
dfcsv2 <- as.data.frame(dfcsv2)
class(dfcsv2)#변경됌
class(dfcsv2$num)
class(dfcsv2$mydata_1)
class(dfcsv2$mydata_2)
class(dfcsv2$mydata_3)
class(dfcsv2$mydata_4)
class(dfcsv2$mydata_5)
class("dd")
str(dfcsv2)#전체 데이터의 구조를 확인
#변환한 데이터들의 타입이 factor
#factor는 순서와 명목형형
#1,2,3....의 값이 어떤 순서를 의미하는 경우: 컬럼의 데이터가 순서형
#class컬럼 1,2,3,4...: 순서를 의미하지 않고 1반, 2반, 3반...
#순서가 적용되도록 정의된 factor타입을 char로 변경
#1번 컬럼을 뺸 나머지 컬럼의 타입을 char로 변환
for(i in 2:ncol(dfcsv2) ){
  dfcsv2[,i]=as.character(dfcsv2[,i])
}
str(dfcsv2)

#### tsv 파일읽기 ####
#tab으로 구분된 파일 (\t)
df3 <- read.delim("02_tsv.txt",sep="\t") #Stringtoken같은 역할
                              #tab으로 짜를거다.
head(df3) #기본 6줄만 보이기


#### xml 파일읽기 ####
#그냥 못 읽고 패키지가 필요하다
install.packages("XML")
library("XML")
?xmlTreeParse
dfxml = xmlTreeParse("03_xml.xml")
dfxml #xml 데이터 읽어옴
#루트 element와 하위 element만 추출
dfxml <- xmlRoot(dfxml)
dfxml #불필요한 데이터가 정제된다. 

#태그name와 태그value를 분리하기     -XXXApply는 for문 대신 사용 함수 
#for와 유사한 function  ,반복작업
dfxml <- xmlSApply(dfxml,function(x){
                  xmlSApply(x,xmlValue)
          })
dfxml
dfxml <- data.frame(t(dfxml), row.names = NULL)
dfxml

#### xlsx 파일읽기 ####
install.packages("readxl")
library("readxl")
dfxlsx <- read_xlsx("07_xlsx.xlsx")
dfxlsx #리턴타임이 tibble이다. data.frame과 비슷하다. 






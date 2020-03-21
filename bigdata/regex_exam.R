library("stringr") #정규식 표현 지원

#패턴 
mytext <- "        testttttt$uuuu"
mytext2 <- "https://cran.r-project.org/"
#패턴과 일치하는 문자열도 리턴 
str_extract(mytext2,".+(:)") #모든 문자열부터 :까지

str_extract(mytext2,".+(?=:)") #모든 문자열부터 :을 뺀 나머지
mytext
str_extract(mytext,".+(?=\\$)") #전방탐색
str_extract(mytext,"(?<=\\$).*") #후방탐색색

#문자열관련 함수
#paste - 백터를 연결해서 하나의 문자열로 생성
#paste0 - 여러개를 연결해서 보여줌
str <- c("java","hadoop","R","mongodb")
paste(str,collapse = "")
paste(str,collapse = " ")
paste(str,collapse = ",")

paste0(mytext,mytext2) #두개 연결

#replace
mytext
gsub("u","ㅗ",mytext) #치환한다
data <- gsub("u"," ",mytext) #짜르기
data
str_trim(data) #띄어쓰기 사라짐짐







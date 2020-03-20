#ggplot2패키지에서 제공되는 mpg데이터를 분석

####step1. mpg를 dataframe로 변경####
mpg1 <- data.frame(mpg)
class(mpg1)

####step2. mpg의 정보를 출력####
# 행 갯수, 열의 갯수, 위에서 10개, 끝에서 10개 출력 
head(mpg1,10)
tail(mpg,10)

####step3. mpg의 컬렁명을 변경 
#cty=>city, hwy=>highway
mpg1 <- rename(mpg1,city=cty)
mpg1 <- rename(mpg1,highway=hwy)
mpg1

####step4. 파생변수 생성하기 
#total컬럼을 추가 => cty와 hwy의 합 
#avg컬럼을 추가 => cty와 hwy의 평균균
mpg1$total <- mpg1$city+mpg1$highway
mpg1$mean <- (mpg1$city+mpg1$highway)/2
mpg1

####step.5 생성된 total을 가지고 요약정보 확인
summary(mpg1$total)


####step.6 info컬럼 추가####
#total값을 이용해서 평가: 30이상이면 pass, 아니면 fail
          #grade컬럼: 40이상 A, 35이상 B, 30이상 C 나머지 D

mpg1[,"info"] <- ifelse(test=mpg1$total<30,
                        yes="Fail",
                        no)
mpg1


mpg1[,"grade"] <- ifelse(test=mpg1$total<30,
                         yes="D",
                         no=ifelse(test=mpg1$total<35,
                                   yes="C",
                                   no=ifelse(test=mpg1$total<40,
                                             yes="B",
                                             no="A")))
mpg1

















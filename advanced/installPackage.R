install.packages("beepr") #라이브러리가 설치된다.
library("beepr") #설치 후 import 해야 한다.
beep() #소리가 나는 라이브러리다다
for (i in 1:10) {
  beep(sound=i)
  Sys.sleep(1) #1초동안 프로세스를 동작시키지 않겠다는 의미 
}
.libPaths() #라이브러리 패스 확인

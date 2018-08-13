#R을 이용한 텍스트 데이터 분석 기초
install.packages("rvest")
install.packages("httr")
library(rvest)
library(httr)
url<-'http://m.movie.daum.net/moviedb/grade?movieId=73750&type=columnist'
GET(url)#페이지의 요소검사로 나오는 태그들을 뽑아옴

response = GET(url)
htxt = read_html(response)
htxt<-repair_encoding(response)
comment<-repair_encoding(html_nodes(htxt,'p.desc_review'))
comment
html_text(comment)

comment = html_nodes(htxt, 'p.desc_review')

html_text(comment)
repair_encoding(html_text(comment))
#repair_encoding 이 한글깨짐을 방지하게 해줌

#7강
library(rvest)
library(httr)
#class 는 제목을 나타내는 태그 (여러개 존재 가능)
#id는 전체 문서(페이지)에서 유일하게 존재
url<-'http://movie.daum.net/moviedetail/moviedetailNetizenPoint.do?movieId=73750'
urlnaver<-'http://movie.naver.com/movie/bi/mi/point.nhn?code=98438'
GET(urlnaver)
read_html(urlnaver)
response<-GET(url)
read_html(response)
htxt<-read_html(response)
comments = html_nodes(htxt, 'span.comment')
html_nodes(htxt,'p.desc_review')
htxt2<-read_html(urlnaver)
html_nodes(htxt2,'div.score_reple')
options(java.parameters=c("-Xmx8g", "-Dfile.encoding=UTF-8"))


#8강 여러 웹 페이지 한 번에 크롤링 하기 (paste, for, if, break 등)

url_base<-'http://m.movie.daum.net/moviedb/grade?movieId=89869&type=netizen&page='
paste('a','b',sep='')
paste('a','b',sep=',')
paste(url_base,1:10,sep = '')
for(i in 1:10)   {print(i)}

for(page in 1:10) 
{print(paste(url_base,page,sep = ''))}
#반드시 print를 써야만 결과들을 나열하여 줌.


for(page in 1:10) {
  url<-(paste(url_base,page,sep = ''))
htxt = read_html(url)
comment<-html_nodes(htxt,'p.desc_review')
review<-html_text(comment)
repair.reviews<-repair_encoding(review)
}
#여기까지 하면 결과는 출력이 안된다.

all.review<-c()
all.review<-c(all.review,repair.reviews)
all.review
for(page in 1:10) {
  url<-(paste(url_base,page,sep = ''))
  htxt = read_html(url)
  comment<-html_nodes(htxt,'p.desc_review')
  review<-html_text(comment)
  repair.reviews<-repair_encoding(review)
  all.review<-c(all.review,repair.reviews)
if(length(repair.reviews)==0){break}
} 
#for이 1:10이기 때문에 결국 all.review 


#9. 크롤링한 데이터 저장했다 불러오기 (write.csv, read.csv)

all.review[1:20]
write.csv(all.review,'review.csv')
read.csv('review.csv',stringsAsFactors=F)
read.csv('review.csv')

#10. 키워드 추출 (KoNLP, stringr)
library(KoNLP)
extractNoun('이 영화 정말 재미있다.')
pos <- paste(SimplePos09('이 영화 정말 재미있다'))
pos
r<-paste(pos)
library(stringr)
posv<-paste(pos)
str_match(posv,'[가-힣]')
str_match(posv,'[가-힣]+')
str_match(posv,'[가-힣]+/N')
str_match(posv,'([가-힣]+)/N')
str_match(posv,'([가-힣]+)/P')
extracted<-str_match(posv,'([가-힣]+)/[NP]')
keyword<-extracted[,2]
keyword
keyword[!is.na(keyword)]
is.na(keyword)

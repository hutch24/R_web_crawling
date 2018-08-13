#R을 이용한 웹 크롤링
library(httr)
GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
#GET방식과 POST방식이 있는데, 브라우저의 개발자 도구를 사용하면 POST라도 자료를 가져올 수 있다
#GET방식은 URL에 흔적이 남나, POST는 글 작성/로그인 처럼 URL이 변하지 않음

library(rvest)
url='http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week'
r=POST(url, encode='form',
       body = list(txtPeriodW='2016-07-02'))
#body안에는 form데이터가 들어간다
?POST
?list
game = read_html(r)
title = html_nodes(game, 'a.tracktitle') #a.tracktitle에 게임 타이틀이 있는 것을 보고 여기서 제목을 불러
titles = html_text(title) #게임 타이틀 이름들만 모아서 저장
titles #잘 저장되었나 확인

#array는 동일한 유형의 데이터만 저장
#list는 서로 다른 유형의 데이터도 저장 가능

list.files()
getwd()
setwd("C:/Users/Hutch's/Documents/Mindscale")

data1<-readLines('seoul_new.txt')

library(httr)
library(rvest)


r<-GET('http://movie.daum.net/moviedb/grade?movieId=73750&type=netizen&page=15')
hrml = read_html(r)
hrml
comment_area = html_nodes(hrml,'.list_review')
comment = html_nodes(hrml,'.desc_review')
comment
html_text(comment)
#class는 .으로 표시, id는 #로 표시시
html_nodes(hrml,'.#dkbody')

#판 한 개 게시물 크롤링
original = GET('http://pann.nate.com/talk/c20019')
k = read_html(pan)
contents = html_node(k,'div#espresso_editor_view')
html_text(contents)

library(RSelenium)
library(httr)
library(rvest)
checkForServer()
startServer()
redr = remoteDriver(browserName = 'chrome')
redr$open()
redr$navigate('http://pann.nate.com/talk/c20019')
search = redr$findElement('css selector', 'div.select_box input[id="검색어"]')
search$clickElement()
url ='http://pann.nate.com/search/categoryPann'
self<-POST(url , body = list(
    cateCd = 20019,
    searchType = 'A',
    page = 2,
    q = '수면'))

pan = read_html(self)
pan

link = html_nodes(pan,'div td.subject a')
link

#네이트 판 '잠'에 관한 글 크롤링
remDr = remoteDriver(browserName = 'chrome')
remDr$open()
remDr$navigate('http://pann.nate.com/talk/c20019')
search.form = remDr$findElement(using = 'id', 'san_keyword')
search.form$sendKeysToElement(list('잠', key = 'enter'))

link = remDr$getPageSource()
link = read_html(link[[1]])
link = unique(html_attr(html_nodes(link, '.list a'), 'href'))
str(link)
paste('address',link)



html_nodes(orht,'div.mainarea div.posting_wrap table.talk_list tbody a')
link
k<-html_attr(link, 'href')
k
html_text(self)
#유저 에이전트 바꾸기
GET('www.cgv.co.kr', user_agent('Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0'))
ua = user_agent('Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0')
GET('www.cgv.co.kr',ua)
#사이트에 POST를 통한 로그인 후 쿠기 정보 받기
res = POST('http://camp.edushare.kr/User/Login',body = list(
  Username = 'hutch24',
  Password = '5lgt0vca!'))
#받은 쿠키를 확인
cookies(res)
session = set_cookies(.cookies = unlist(cookies(res)))

res = GET('http://camp.edushare.kr',session)

#네이버 로그인 연습
self<-POST('http://nid.naver.com/nidlogin.login' , body = list(
  enctp = '1',
  encpw = '43ddfdbdd44c483e881d0ffff71e3900c5847b144bbadb1823d7f083c2f681fcb825937fe829d0d0a55097d97d34bf47ab580ddc3e48a792a5a688c8dc338321bd1392691e92a31fbb900fd0dd6ce3d220d7e948273fcda85d71ddd5353505084475723fed5c27190a1676aa54f12c0e6dad00b83d55e365337ff057736f4836',
  encnm = '100011194',
  svctype = '0',
  enc_url = 'http%3A%2F%2Fwww.naver.com%2F',
  smart_level = '-1'
))
cookies(self)
id = set_cookies(.cookies = unlist(cookies(self)))
test = GET('http://www.naver.com' , id)
#위 과정 까지 로그인 한 후, 이것이 잘 되었나 로그아웃노드가 있는지 아래과정으로 확인
h = read_html(test)
html_nodes(h , '.btn_inr')#잘 안됨
html_nodes(h, '.user_info')
#네이버의 문제인지 잘 안됨

#네이버 뉴스기사 크롤링
news = GET('http://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=101')
htxt = read_html(news)
html_nodes(htxt, 'div.list_body.newsflash_body')

today_news = GET('http://news.naver.com/main/main.nhn?mode=LSD&mid=shm&sid1=100')
tran = read_html(today_news)
link = html_nodes(tran , '.list_body.section_index a')
k<-html_attr(link, 'href')
head(k)
aticle.href = unique(k)  
aticle.href
#여러 뉴스기사 반복 크롤링
href =c()
for(href in aticle.href){
  GET(href)
  write.csv(href,'ccc.csv')
}
#첨부파일 다운받기
file = GET('https://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(file, 'raw'), 'httr.pdf')

#이미지 긁어오기
h = read_html('https://search.naver.com/search.naver?where=post&sm=tab_jum&ie=utf8&query=grep')
h1<-html_nodes(h,'img.sh_blog_thumbnail')
h1
img.src<-html_attr(h1,'src')
img.src
?grep
grep('pstatic', img.src)
img.src = img.src[grep('pstatic', img.src)]
img.src

p = 1

paste0(p,'.jpg')
sprintf('p%02d',u)
sprintf('p%02d.jpg',3)


for(i in 1:length(img.src)){
  res = GET(length(img.src[i]))
  writeBin(content(res,'raw'), sprintf('%02d.jpg',i))
}
res

#시간 표시
strptime('2016.07.18','%Y.%m.%d')
#strptime은 문자를 날짜로 인식해줌.
t = strptime('2015-07-08','%Y-%m-%d')
t
t$year #1900년 기준
attributes(t)
t$mon #1월이 0으로 표시

strftime(t)
#strftime은 날짜를 문자로 바꿔준다.
strftime(t,"%y/%m/%d")
strftime(t,"%Y-%m-%d")


#자바스크립트가 있는 페이지의 자바스크립트가 적용된부분 크롤링.
h=read_html('http://www.inven.co.kr/board/powerbbs.php?come_idx=2152&l=19094')
html_nodes(h, 'div.comment')
comment.url = 'http://www.inven.co.kr/common/board/comment.xml.php?dummy=1469368057615'
comment = POST(comment.url, 
               body=list(
                 comeidx=2152,
                 articlecode=19094,
                 sortorder='date',
                 act='list',
                 out='xml',
                 replynick='',
                 replyidx=0
               ))
x= read_xml(comment)
x
xml_nodes(x, 'item o_comment')
xml_text(xml_nodes(x, 'item o_comment'))

#r셀레늄 사용하는 법.
install.packages('RSelenium')
library(RSelenium)
checkForServer()
startServer()
firefox = remoteDriver(browserName = 'firefox')
firefox$open()
find.package('RSelenium')
firefox$navigate('http://www.google.com')
firefox$close()

chrome = remoteDriver(browserName = 'chrome')
chrome$open()
chrome$navigate('http://www.google.com')
chrome$close()
chrome$navigate('http://www.seleniumhq.org/')
menu.download = chrome$findElement('css selector', '#menu_download a')
menu.download$clickElement()
chrome$click

h = read_html(chrome$getPageSource()[[1]])


remDr = remoteDriver(browserName = 'chrome')
remDr$open()
remDr$navigate('http://www.kinds.or.kr/search/totalSearchMain.do')
remDr$findElement('text')
search.form = remDr$findElement(using = 'id', 'searchTotal')
search.form$sendKeysToElement(list('브렉시트', key = 'enter'))

link = remDr$getPageSource()
link = read_html(link[[1]])
link = unique(html_attr(html_nodes(link, '.list a'), 'href'))
paste('address',link)


#네이버카페 크롤링.

list.url = 'http://m.cafe.naver.com/ArticleList.nhn?search.clubid=21771779&search.menuid=80&search.boardtype=L'
h.list = read_html(list.url)
html_nodes(h.list,'ul.list_type1 li a p strong') #여기까지 카페글제목추출.
html_text(html_nodes(h.list,'ul.list_type1 li a p strong'))#텍스트만 남기기.

library(stringr)
t
t = str_trim(html_text(html_nodes(h.list,'ul.list_type1 li a p strong')))#공백없애기.
t = html_text(html_nodes(h.list,'ul.list_type1 li a p strong'))
str_replace_all(t, '[[:space:]]','')  #중간공백 없애기.
str_replace_all(t, '[[:space:]]+',' ') #하나이상의 공백을 모두 한개로 바꿈.

#게시물 링크추출
title.links = html_nodes(h.list, 'ul.list_type1 li a')
article.links = html_attr(title.links, 'href')  
article.links

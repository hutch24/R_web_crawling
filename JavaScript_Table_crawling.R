#R Selenium을 사용하여 국토교통부 표준공시지가 크롤링하기

library(RSelenium)
library(httr)
library(rvest)
checkForServer()
startServer()
redr = remoteDriver(browserName = 'chrome')
redr$open()
redr$navigate('http://www.realtyprice.kr/notice/search/gsSearchList.search')
sido = redr$findElement('css selector', 'select#sido_list.area option[value="11"]')
sido$clickElement()

sid = redr$findElement(using='id',value='sido_list')
sid$sendKeysToElement(list('서울특별시'))

sgg = redr$findElement(using = 'id',value = 'sgg_list')
sgg$sendKeysToElement(list('강남구'))

sgg2 = redr$findElement('css selector','option[value="11680"]')
sgg2$clickElement()

emd = redr$findElement('css selector', 'option[value="10600"]')
emd$clickElement()

search = redr$findElement('css selector', 'p.search-bt input')
search$clickElement()

#결과를 매트릭스화하기.
src = redr$getPageSource()[[1]]
h= read_html(src)
i = html_text(html_nodes(h, 'td'))
i
library(stringr)
str_trim(i)
i
matrix(i,ncol=11, byrow = T)
?matrix


nextbutton = redr$findElements(using = 'xpath', '//a[@href="javascript:goPage(7)"]')
nextbutton[[1]]$clickElement()


#한글 인코딩 문제 해결하기.
text <-"한글이 잘 나오나"
repair_encoding(text)
guess_encoding(text)
iconv(text,'EUC-KR','UTF8')

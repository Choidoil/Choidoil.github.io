import csv 
from urllib.request import urlopen 
from urllib.parse import quote_plus 
from bs4 import BeautifulSoup 

def search(word):
    print('크롤링 작업 중입니다.')
    url = f'''https://m.search.naver.com/search.naver?where=m_view&sm=mtb_jum&query={quote_plus(word)}'''
    html = urlopen(url).read() 
    soup =  BeautifulSoup(html,'html.parser')
    total = soup.select('.api_txt_lines.total_tit')
    # 저장작업
    data = [] 
    for i in total:
        print(i.text)
        print(i.attrs['href'])
        data.append([i.text,i.attrs['href']])
    return data

if __name__ == '__main__':
    search('인공지능')

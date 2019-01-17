require 'pry'
require 'nokogiri'
require 'open-uri'




def get_townhall_email(townhall_url)
	x = 0
	mail = []
	while townhall_url[x]
		page = Nokogiri::HTML(open('http://www.annuaire-des-mairies.com' + townhall_url[x][1..-1]))
		page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |i|
			mail << i.text
		end
		x += 1
	end
	return mail
end

def get_townhall_urls
	t_url = []
	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	page.xpath('//a[@class="lientxt"]').each do |i|
		t_url << i["href"]
	end
	return t_url
end

def t_name
	town_name = []
	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	page.xpath('//a[@class="lientxt"]').each do |i|
		town_name << i.text
	end
	return town_name
end


def perform
	x = 0
	a = []
	url = get_townhall_urls
	mail = get_townhall_email(url)
	town_name = t_name
	while t_name[x]
		a[x] = { t_name[x] => mail[x] }
		x += 1
	end
	return a
end
a = perform

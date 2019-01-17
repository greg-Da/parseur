require 'pry'
require 'nokogiri'
require 'open-uri'

def currency
	
	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	curr_name = []
	curr_price = []


	page.xpath('//tbody//td[2]/span/a').each do |i|
		curr_name << i.text
	end

	page.xpath('//tbody//td[5]/a').each do |i|
		curr_price << i.text[1..-1].to_f
	end
	x = 0
	a = []
	while curr_name[x]
		a[x] = { curr_name[x] => curr_price[x] }
		x += 1
	end
	return a
end
a = currency
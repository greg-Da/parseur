require 'pry'
require 'nokogiri'
require 'open-uri'

def get_depute_email(depute_url)
	page = Nokogiri::HTML(open(depute_url))   
	page.xpath('//div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').text
	
end

def get_depute_urls
	depute_name =[]
	depute_url = []
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))  
	page.xpath('//*[@class="list_dep jstitle phototitle block"]').each do |link|
	  depute_name <<  link.children[3].text.delete(" ").chomp.split(",")
	  depute_url << "https://www.nosdeputes.fr" + link.parent["href"]
	end
	return [depute_url, depute_name]
end


def perform 
	depute_inf = get_depute_urls
	url_list = depute_inf[0]
	name_list = depute_inf[1]
	hash_depute = [] 

	url_list.each_with_index do |depute_url,i|

		hash_depute << { "first_name" => name_list[i][1],"family_name" => name_list[i][0][1..-1], "email" => get_depute_email(depute_url)}
		if i > 600
			return hash_depute
		end
	end

	return hash_depute
end
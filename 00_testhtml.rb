require 'nokogiri'
require 'open-uri'

$page = Nokogiri::HTML(open("https://www.offi.fr/theatre/populaires.html"))


# prints in the form of array all the specified items
def printall
  $page.css('.oneRes').each do |play|
    puts "#{play.css('.eventTitle').text}---#{play.css('.detail li a')[0].text}"
  end
end

# added "filter" on the above result
# and the filter doesn't have to be in the printed results
# following is examples
def printcat(cat)
  list = $page.css('.oneRes').select{|play| play.css('.detail li a')[1].text == cat}
  list.each do |play|
      puts "#{play.css('.eventTitle').text}---#{play.css('.detail li a')[0].text}"
  end
end

# another way to select
# it means print the a where criteria is equal to target
# in the example criteria is an attibute under a
def printcre(criteria, target)
  list = $page.css("a[#{criteria} = #{target}]")
  list.each do |item|
    puts item['href']
  end
end

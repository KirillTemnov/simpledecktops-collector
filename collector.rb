#!/usr/bin/env ruby

#
# collect links to all decktop wallpapers from
# great project http://simpledesktops.com/
#

require "nokogiri"

max_pages = 1

domain = "http://simpledesktops.com/browse/"
links = []
(1..10).each do |i|
  doc = Nokogiri::HTML.parse `curl #{domain}#{i}/`
  doc.css("img").each { |img|
    if img["src"] =~ /^http\:\/\/static\.simpledesktops\.com\/desktops/
        links.push img["src"].sub(/\.\d+x\d+_q100\.png$/, "")
    end
  }
  
end
puts links


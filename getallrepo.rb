#!/usr/bin/env ruby


require 'json'
require 'open-uri'

print "Hello from ruby\r\n"
user = "tservi"
if ARGV.length > 0
    user = ARGV[0]
end
print "Fetching all repo from user : " + user + "\r\n"
src = open("https://api.github.com/search/repositories?q=user:"+user+"&sort=stars&order=desc")
myjson = JSON.load(src)
myjson["items"].each do |repo|
     %x[git clone #{repo["clone_url"]} ]
end

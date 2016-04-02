#!/usr/bin/env ruby

# Author: Zach Alam
# Website: http://zachalam.com

require 'net/http'

# create an array of sites we wish to visit concurrently.
urls = ['http://youtube.com','http://bing.com','http://google.com']

# Create an array to keep track of threads.
threads = []


urls.each do |u|
    # spawn a new thread for each url
    threads << Thread.new do
	Net::HTTP.get(URI.parse(u))
        # DO SOMETHING WITH URL CONTENTS HERE
        # ...
        puts "Request Complete: #{u}\n"
    end
end

# wait for threads to finish before ending program.
threads.each { |t| t.join }

puts "All Done!"

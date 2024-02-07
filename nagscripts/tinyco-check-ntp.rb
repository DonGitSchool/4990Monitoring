#!/usr/bin/env ruby

if ARGV.empty?
  puts "gimme an IP and i'll tell you if there's an NTP service there on the default port"
  puts "takes one argument : an ip you wanna see if there's an NTP service"
  exit 3
end


ip_to_check = ARGV[0]

did_that_work = `ntpdate -q #{ip_to_check} | grep stratum | wc -l`.strip.to_i


if did_that_work != 1
  puts "dooDooDOOT! The System! The System! The System is Down! The System is Down!"
  exit 2
end

puts "ntp service works at #{ip_to_check}"
exit 0


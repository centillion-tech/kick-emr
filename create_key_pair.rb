2#!/usr/bin/env ruby
require 'rubygems'
require 'aws-sdk'

exit 0 if ARGV[0] == nil

ec2 = Aws::EC2::Client.new(region: "ap-northeast-1")
begin
  r = ec2.create_key_pair(key_name: ARGV[0])
  print r[:key_material]
rescue => e
  print "*** Error: #{e}\n"
end

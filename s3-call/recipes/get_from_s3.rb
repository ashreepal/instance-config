#
# Cookbook Name:: s3-call
# Recipe:: get_from_s3
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'aws'

# get the name of the file and the bucket it's in to get it from S3
bucket_name = node['s3_call']['bucket_name']
file_name = node['s3_call']['file_name']

# get credentials
config_file = File.open('/opt/aws/credentials.cfg') { |f| f.read }
config_obj = YAML.load(config_file)
config_obj.delete(:region)

Chef::Log.info(config_obj)

AWS.config(config_obj)

s3 = AWS::S3.new

# save the file
Chef::Log.info(Dir.glob("/opt/aws/*"))
curr_dir = Dir.pwd
Dir.chdir("/opt/aws/gems")
save_file = File.new("#{file_name}", 'w+')
Chef::Log.info(Dir.glob("/opt/aws/*"))
object = s3.buckets[bucket_name].objects[file_name]
object.read do |chunk|
  save_file.write(chunk)
end
save_file.close
Dir.chdir(curr_dir)

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
creds = {}
creds[:access_key_id] = node['AWS-user-credentials']['access_key_id']
creds[:secret_access_key] = node['AWS-user-credentials']['secret_access_key']
creds[:region] = 'us-east-1'

# register with AWS
AWS.config(creds)

s3 = AWS::S3.new

# save the file
Chef::Log.info(Dir.glob("/opt/temp"))
#save_file = File.open("/opt/temp/#{file_name}", 'w+')
save_file = ""
object = s3.buckets[bucket_name].objects[file_name]
object.read do |chunk|
  save_file += chunk
end

template "/opt/temp/#{file_name}" do
  source 'get_from_s3.gem.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables :gem => save_file
end

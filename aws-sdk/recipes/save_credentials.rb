#
# Cookbook Name:: aws-sdk
# Recipe:: save_credentials
#
# Copyright 2013, ashreepal
#
# All rights reserved - Do Not Redistribute
#

require 'yaml'

# get credentials data and write to a cfg file
creds = {}
creds[:access_key_id] = node['AWS-user-credentials']['access_key_id']
creds[:secret_access_key] = node['AWS-user-credentials']['secret_access_key']
creds[:region] = 'us-east-1'

template '/opt/aws/credentials.cfg' do
  source 'credentials.cfg.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables :creds => creds.to_yaml
end

#File.open("/opt/aws/credentials.cfg", "w+") { |f| f.write(creds.to_yaml) }

# set permissions for file
#File.chmod(0644, "/opt/aws/credentials.cfg")

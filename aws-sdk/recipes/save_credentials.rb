#
# Cookbook Name:: aws-sdk
# Recipe:: save_credentials
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'yaml'

# get credentials data and write to a cfg file
creds = {}
creds['access_key_id'] = node['AWS-user-credentials']['access_key_id']
creds['secret_access_key'] = node['AWS-user-credentials']['secret_access_key']
creds['region'] = 'us-west-2'

File.open("/opt/aws/credentials.cfg", "w+") { |f| f.write(creds.to_yaml) }

# set permissions for file so user can only read and write, and others can only
# read
File.chmod(0644, "/opt/aws/credentials.cfg")
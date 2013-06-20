#
# Cookbook Name:: aws-sdk
# Recipe:: configure
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'aws'
require 'yaml'

# configuring credentials for the user
config_file = File.open('/opt/aws/credentials.cfg') { |f| f.read }
new_config = AWS.config(YAML.load(config_file))

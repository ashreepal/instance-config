#
# Cookbook Name:: s3-call
# Recipe:: create_directory
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the root directory
directory "/opt/aws/gems" do
  mode "755"
  action :create
end

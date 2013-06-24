#
# Cookbook Name:: s3-call
# Recipe:: create_directory
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the root directory
directory "/opt/temp" do
  owner "root"
  group "root"
  mode "755"
  action :create
end

Chef::Log.info("\nDirectory /opt/temp should have been created\n")
Chef::Log.info(`ls -la /opt`)

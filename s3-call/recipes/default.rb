#
# Cookbook Name:: s3-call
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create a directory for the new gem
include_recipe 's3-call::create_directory'

# get the gem from s3
include_recipe 's3-call::get_from_s3'

# install the gem
include_recipe 's3-call::install_gem'

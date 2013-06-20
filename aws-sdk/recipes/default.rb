#
# Cookbook Name:: aws-sdk
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create a directory for and install the AWS-SDK gem
include_recipe 'aws-sdk::install_aws_sdk'

# save the user's credentials
include_recipe 'aws-sdk::save_credentials'

# run the configure recipe now that the AWS-SDK gem has been installed
include_recipe 'aws-sdk::configure'

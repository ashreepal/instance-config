#
# Cookbook Name:: aws-sdk
# Recipe:: default
#
# Copyright 2013, ashreepal
#
# All rights reserved - Do Not Redistribute
#

# create a directory for and install the AWS-SDK gem
include_recipe 'aws-sdk::install_aws_sdk'

# save the user's credentials and configure
include_recipe 'aws-sdk::save_credentials_and_configure'

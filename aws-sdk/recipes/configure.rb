# configuring credentials for the user
require 'aws'

# get config data and try to configure AWS
config = node['AWSconfig']

config['region'] = 'us-west-2'
AWS.config(config)

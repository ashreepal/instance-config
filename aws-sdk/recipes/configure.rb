# configuring credentials for the user
require 'aws'
require 'yaml'

config_file = File.open('/opt/aws/credentials.cfg') { |f| f.read }
AWS.config(YAML.load(config_file))

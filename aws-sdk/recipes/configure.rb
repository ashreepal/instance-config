require 'aws'
require 'yaml'

# configuring credentials for the user
config_file = File.open('/opt/aws/credentials.cfg') { |f| f.read }
new_config = AWS.config(YAML.load(config_file))

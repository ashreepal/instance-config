require 'aws'

# get the name of the file and the bucket it's in to get it from S3
bucket_name = node['s3_call']['bucket_name']
file_name = node['s3_call']['file_name']

# get credentials
config_file = File.open('/opt/aws/credentials.cfg') { |f| f.read }
config_obj = YAML.load(config_file)
config_obj.delete(:region)

Chef::Log.info(config_obj)

AWS.config(config_obj)

s3 = AWS::S3.new

# save the file
save_file = File.open("/opt/aws/gems/#{file_name}", 'w')
object = s3.buckets[bucket_name].objects[file_name]
object.read do |chunk|
  save_file.write(chunk)
end
save_file.close

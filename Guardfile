# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', spec_paths: ['spec', '*/specs'] do
  watch(%r{^spec/.+_spec\.rb$})

  # run all specs when you change the spec_helper.rb file
  watch('spec/spec_helper.rb') { 'spec' }

  # run a recipe's spec when it is changed
 # watch(%r{^(.+)/recipes/(.+)\.rb$}) do |m|
 #   "#{m[1]}/spec/#{m[2]}_spec.rb"
 # end
end

Chef::Log.info("Adding environment_variables.rb")

# map the environment_variables node to ENV
node[:deploy].each do |application, deploy|
  deploy[application][:environment].each do |key, value|
    Chef::Log.info("Setting ENV[#{key}] to #{value}")
    ENV[key] = value
  end
end

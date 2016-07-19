
node[:deploy].each do |app, deploy|

 directory "#{deploy[:deploy_to]}/shared/config" do
      owner "deploy"
      group "www-data"
      mode 0774
      recursive true
      action :create
  end

  file File.join(deploy[:deploy_to], 'shared', 'config', 'app_data.yml') do
    content YAML.dump(node[:deploy][app][:environment].to_hash)
  end
end


Chef::Log.info("Adding environment_variables.rb")

# map the environment_variables node to ENV
node[:deploy].each do |application, deploy|
  node[:deploy][application][:environment].each do |key, value|
    Chef::Log.info("Setting ENV[#{key}] to #{value}")
    ENV[key] = value
  end
end

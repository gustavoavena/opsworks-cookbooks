Chef::Log.info("Adding environment_variables.rb")

node[:deploy].each do |app, deploy|
  application_environment_file do
    user deploy[:user]
    group deploy[:group]
    path ::File.join(deploy[:deploy_to], "shared")
    environment_variables deploy[:environment_variables]
  end
end

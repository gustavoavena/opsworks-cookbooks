Chef::Log.info("Adding environment_variables.rb")



template "#{node[:deploy][:deploy_to]}/shared/app.env" do
    mode "0600" # what permissions should I give?
    user deploy[:user]
    group deploy[:group]
    path ::File.join(deploy[:deploy_to], "shared")
    environment_variables deploy[:environment_variables]
end

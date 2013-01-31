#
# Cookbook Name:: testrepo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vim"
include_recipe "apt::default"
include_recipe "git"

application "testrepo" do
  path "/home/vagrant"
  owner "vagrant"
  group "vagrant"

  repository node[:testrepo][:repository]
  revision node[:testrepo][:revision]

  environment_name node[:environment] || "development"

  # Apply the rails LWRP from application_ruby
  rails do
    # Rails-specific configuration. See the README in the
    # application_ruby cookbook for more information
    gems %w{bundler}
    #bundler_without_groups ["mysql"].
  end

  # Apply the passenger_apache2 LWRP, also from application_ruby
  passenger_apache2 do
    # Passenger-specific configuration.
    server_aliases %w{ vcap.me }
  end
end
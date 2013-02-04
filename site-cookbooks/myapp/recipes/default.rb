#
# Cookbook Name:: myapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "passenger_apache2::mod_rails"

##Create the app
application "myapp" do
  path "/home/vagrant"
  owner "vagrant"
  group "vagrant"

  repository "git://github.com/mikenairn/testrepo.git"
  revision "master"

  environment_name "development"

  migrate true

  # Apply the rails LWRP from application_ruby
  rails do
    # Rails-specific configuration. See the README in the
    # application_ruby cookbook for more information

    bundler true

    database do
      adapter "mysql2"
      encoding "utf8"
      reconnect true
      database "myapp_development"
      username "myapp"
      password "p@ssw0rd1app"
    end

    #bundler_without_groups ["mysql"].
  end

  # Apply the passenger_apache2 LWRP, also from application_ruby
  passenger_apache2 do
    # Passenger-specific configuration.
    server_aliases %w{ vcap.me }
  end

end

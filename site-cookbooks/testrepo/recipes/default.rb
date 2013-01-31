#
# Cookbook Name:: testrepo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

application "testrepo" do
  path "/home/vagrant"
  owner "vagrant"
  group "vagrant"

  repository "git@github.com:mikenairn/testrepo.git"
  revision "master"

  # Apply the rails LWRP from application_ruby
  rails do
    # Rails-specific configuration. See the README in the
    # application_ruby cookbook for more information.
  end

  # Apply the passenger_apache2 LWRP, also from application_ruby
  passenger_apache2 do
    # Passenger-specific configuration.
  end
end
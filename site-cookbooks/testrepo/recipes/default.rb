#
# Cookbook Name:: testrepo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#package = "ruby_1.9.3-p194-1_amd64.deb"
#file_path = "/tmp/#{package}"
#
#remote_file package do
#  path file_path
#  source "http://ruby-packages-ubuntu-precise.googlecode.com/files/#{package}"
#end if !File.exists?(file_path)
#
#package "ruby" do
#  action :install
#  source file_path
#  provider Chef::Provider::Package::Dpkg
#end

#script "replace_ruby" do
#  interpreter "bash"
#  user "root"
#  environment ({'HOME' => '/root'})
#  cwd "/tmp"
#  code <<-EOH
#    source /etc/environment
#    echo "PATH=$PATH:/opt/ruby/bin" > /etc/profile.d/vagrant_ruby.sh
#    source /etc/profile.d/vagrant_ruby.sh
#    rm -rf /opt/vagrant_ruby
#  EOH
#end

#include_recipe "vim"
#include_recipe "apt::default"
#include_recipe "rvm::system"
#include_recipe "apache2"
#include_recipe "rvm_passenger::apache2"
#include_recipe "mysql::server"
#include_recipe "database::mysql"
#include_recipe "git"
#
###Create database
#mysql_connexion = {:host => 'localhost',
#                   :username => 'root',
#                   :password => node['mysql']['server_root_password'] }
#
#%w{ testrepo_production testrepo_development testrepo_test }.each do |db|
#  mysql_database "#{db}" do
#    connection mysql_connexion
#    action :create
#  end
#end
#
###Create the app
#application "testrepo" do
#  path "/home/vagrant"
#  owner "vagrant"
#  group "vagrant"
#
#  repository node[:testrepo][:repository]
#  revision node[:testrepo][:revision]
#
#  environment_name node[:environment] || "development"
#
#  migrate false
#
#  # Apply the rails LWRP from application_ruby
#  rails do
#    # Rails-specific configuration. See the README in the
#    # application_ruby cookbook for more information
#
#    bundler true
#
#    database do
#      adapter "mysql2"
#      encoding "utf8"
#      reconnect false
#      database "testrepo_development"
#      username "root"
#      password "password"
#    end
#
#    #gems %w{bundler}
#
#    bundle_command "bundle"
#
#    #bundler_without_groups ["mysql"].
#  end
#
#  # Apply the passenger_apache2 LWRP, also from application_ruby
#  passenger_apache2 do
#    # Passenger-specific configuration.
#    server_aliases %w{ vcap.me }
#  end
#
#end
#
#execute "db:migrate" do
#  command "su -l -c 'cd /home/vagrant/current && bundle exec rake db:migrate RAILS_ENV=development' vagrant"
#  cwd "/home/vagrant/current"
#  user 'root'
#end

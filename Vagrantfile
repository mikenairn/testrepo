# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.forward_port 80, 8181, :auto => true

  config.vm.network :hostonly, "192.168.33.11"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w{cookbooks site-cookbooks}
    chef.roles_path = "./roles"
    chef.data_bags_path = "./data_bags"
    chef.add_recipe('chef-solo-search')
    chef.add_recipe('apt::default')
    chef.add_recipe('rvm::system')
    chef.add_role "production"
    chef.add_role "myappdatabasemaster"
    chef.add_role "myapp"

    chef.json = {
        :rvm => {
            :vagrant => {
                :system_chef_solo => '/opt/vagrant_ruby/bin/chef-solo'
            },
            :global_gems => [{ :name => 'bundler'}, { :name => 'chef'}]
        }
    }

  end

end

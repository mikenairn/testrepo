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
    chef.add_recipe('rvm::vagrant')
    chef.add_role "dev"
    chef.add_role "testrepo"

    chef.json = {
        :rvm => {
            :vagrant => {
                :system_chef_solo => '/opt/vagrant_ruby/bin/chef-solo'
            },
            :global_gems => [{ :name => 'bundler'}]
        }
    }

  end

end

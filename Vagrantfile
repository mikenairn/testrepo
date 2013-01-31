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
    chef.add_role "dev"
    chef.add_role "testrepo"
  end

end

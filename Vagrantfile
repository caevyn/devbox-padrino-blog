# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "ubuntu/trusty32"
  config.vm.hostname = 'ruby-dev-box'
  
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
    
  config.vm.network "public_network"

  config.vm.synced_folder "dev/", "/home/mmurphy/dev"

  config.vm.provider "virtualbox" do |vb|
     #vb.gui = true
  
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
 
  config.vm.provision :shell, :path => "shell/main.sh"
  
  #PROXY:
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.0.2.2:3128/"
    config.proxy.https    = "http://10.0.2.2:3128/"
    config.proxy.no_proxy = "localhost,127.0.0.1,10.0.2.2"
  end
end

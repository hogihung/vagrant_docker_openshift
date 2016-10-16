# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.1"
  config.vm.hostname = "openshift.home.net" 

  # Setup static ip address to be used with the Atlassian Suite of Application Servers
  config.vm.network "private_network", ip: "192.168.50.90"

  # Run provisioning for pre-install and docker 
  config.vm.provision "shell", path: 'provisioning/pre_install.sh'
  config.vm.provision "shell", path: 'provisioning/git_provision.sh'
  config.vm.provision "shell", path: 'provisioning/docker_provision.sh'
  config.vm.provision "shell", path: 'provisioning/openshift_provision.sh'

  # Support for OpenShfit on port 8443
  config.vm.network "forwarded_port", guest: 8443, host: 8443, id: "openshift"

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 2048
    vb.cpus   = 2
  end
end

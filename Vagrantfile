# -*- mode: ruby -*-
# vi: set ft=ruby :

VMBOX_MEMORY = 256
USE_NFS = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/

Vagrant.configure("2") do |config|
  config.vm.hostname = "vm-epam-symfony-ansible"

  config.vm.box = "CentOS-6.5-i386-v20140504"
  config.vm.box_url = "https://vagrantcloud.com/nrel/CentOS-6.5-i386/version/3/provider/virtualbox.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", VMBOX_MEMORY]
  end

  config.vm.network :private_network, ip: "33.33.22.22", auto_config: true

  config.vm.synced_folder "./shared/", "/var/shared",
    :nfs => { :mount_options => ["dmode=777","fmode=777"] }

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.provision :shell, inline: "bash /vagrant/scripts/install.sh", privileged: false

  config.vm.provision :shell, inline: "echo 'VM booted successfully!'"
end
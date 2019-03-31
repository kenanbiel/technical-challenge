Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    config.vm.box = "ubuntu/bionic64"
    v.customize ["modifyvm", :id, "--memory", 4096, "--cpuexecutioncap", "100"]
    config.vm.network :forwarded_port, host: 8080, guest: 80
    config.vm.define "status-page"
  end

  config.vm.hostname = "dev-role-type-app-us-east-1.localhost.io"

  config.vm.provision :shell, :inline => "sudo apt-get update"
  config.vm.provision :shell, :inline => "sudo wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/2018.3/SALTSTACK-GPG-KEY.pub | apt-key add -"
  config.vm.provision :shell, :inline => "sudo echo \"deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/2018.3 bionic main\" > /etc/apt/sources.list.d/saltstack.list"
  config.vm.provision :shell, :inline => "sudo apt-get update"
  config.vm.provision :shell, :inline => "sudo apt-get install apt-transport-https -y"
  config.vm.provision :shell, :inline => "sudo mkdir -p /etc/salt"
  config.vm.provision :shell, :inline => "sudo apt-get install salt-minion --force-yes -y"
  config.vm.provision :shell, :inline => "sudo mkdir -p /etc/salt/gpgkeys"
  config.vm.provision :shell, :inline => "sudo cp -prv /vagrant/gpgkeys/*.gpg /etc/salt/gpgkeys"
  config.vm.provision :shell, :inline => "sudo chown -R root. /etc/salt/gpgkeys ; sudo chmod -R 600 /etc/salt/gpgkeys"
  config.vm.provision :shell, :inline => "touch /etc/is_vagrant_vm"
  config.vm.synced_folder "srv", "/srv"
  config.vm.provision :shell, :inline => "ln -s /srv/salt/_grains /etc/salt/_grains"

  config.vm.provision :salt do |salt|
    salt.bootstrap_options = '-c /tmp/ -P'
    salt.no_minion = false
    salt.masterless = true
    salt.verbose = true
    salt.minion_config = "minion"
    salt.run_highstate = true
  end
end

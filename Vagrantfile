# -*- mode: ruby -*-
# vi: set ft=ruby :

builds = {
  'master.com' => {
    ip: "192.168.10.25",
    memory: "1024",
    hostname: "master.com"
  },
  'namenode' => {
    ip: "192.168.10.26",
    memory: "1024",
    hostname: "namenode"
  },
  'datanode' => {
    ip: "192.168.10.27",
    memory: "1024",
    hostname: "datanode"
  },
  'resourcemanager' => {
    ip: "192.168.10.28",
    memory: "1024",
    hostname: "resourcemanager"
  },
  'nodemanager1' => {
    ip: "192.168.10.29",
    memory: "1024",
    hostname: "nodemanager1"
  },
  'historyserver' => {
    ip: "192.168.10.30",
    memory: "1024",
    hostname: "historyserver"
  }
}


Vagrant.configure("2") do |config|
  
    config.vm.box = "centos/7"

    builds.each_pair do |name, opts|

    config.vm.define name.to_sym do |guest|

      guest.vm.network "private_network", ip: opts[:ip]

      guest.vm.provider "virtualbox" do |vb|
        vb.memory = opts[:memory]
      end
      guest.vm.provision :shell, :path => "installdocker.sh", :args => "#{opts[:hostname]}"
    end
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

builds = {
  'master.com' => {
    ip: "192.168.10.25",
    memory: "1024",
    hostname: "master.com"
  },
  'worker1.com' => {
    ip: "192.168.10.26",
    memory: "1024",
    hostname: "worker1.com"
  },
  'worker2.com' => {
    ip: "192.168.10.27",
    memory: "1024",
    hostname: "worker2.com"
  },
  'worker3.com' => {
    ip: "192.168.10.28",
    memory: "1024",
    hostname: "worker3.com"
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

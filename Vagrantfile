Vagrant.configure("2") do |config|

  config.vm.box = "generic/rocky9"

  config.vm.hostname = "rocky-devops"

  config.vm.network "private_network",
    type: "static",
    ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |v|
    v.name = "rocky-devops"
    v.memory = 4096
    v.cpus = 2
  end

end
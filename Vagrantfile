Vagrant.configure("2") do |config|

  config.vm.box = "generic/rocky9"

  config.vm.hostname = "rocky-devops"

  config.vm.network "private_network",
    type: "static",
    ip: "192.168.56.10"

  # Mount the student-list folder from the host to the guest VM  
  config.vm.synced_folder "../student-list",
    "/home/vagrant/projects/student-list",
    type: "rsync"

  # Mount the cvOnline folder from the host to the guest VM
  config.vm.synced_folder "/home/jonas-dev/Bureau/SassApp/cvOnline",
    "/home/vagrant/projects/cvOnline",
    type: "rsync"

  # Mount the scripts folder from the host to the guest VM
  config.vm.synced_folder "./scripts",
    "/home/vagrant/scripts",
    type: "rsync"

  # Provision the VM with a shell script to install Docker  
  config.vm.provision "shell",
    path: "scripts/setup-server.sh"

  config.vm.provider "virtualbox" do |v|
    v.name = "rocky-devops"
    v.memory = 4096
    v.cpus = 2
  end

end
Vagrant.configure("2") do |config|
    # Select the box (Ubuntu 20.04 LTS)
    config.vm.box = "ubuntu/focal64"
    
    # Configure VM settings
    config.vm.provider "virtualbox" do |vb|
        vb.memory = 2048  # 2GB RAM
        vb.cpus = 4       # 2 CPUs
        vb.name = "vagrant_vm"
    end
    
    # Network configuration
    config.vm.network "private_network", type: "dhcp"
    
    # Port forwarding
    config.vm.network "forwarded_port", guest: 80, host: 8080
    
    # Shared folder
    config.vm.synced_folder ".", "/vagrant"
    
    # Provision script
    config.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y python3 python3-pip git
        # Add more packages as needed
    SHELL
end

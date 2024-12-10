MACHINES = {
    :"zabbix" => {
                :box_name => "ubuntu/jammy64",
                :cpus => 4,
                :memory => 4096,
                :net => [
                  ["192.168.56.150",  2, "255.255.255.0", "intnet"],
               ]
              }
  }
  
  Vagrant.configure("2") do |config|
    MACHINES.each do |boxname, boxconfig|
      config.vm.synced_folder ".", "/vagrant"
      config.vm.define boxname do |box|
        box.vm.box = boxconfig[:box_name]
        box.vm.box_version = boxconfig[:box_version]
        box.vm.host_name = "zabbix"
        boxconfig[:net].each do |ipconf|
          box.vm.network("private_network", ip: ipconf[0], adapter: ipconf[1], netmask: ipconf[2])
          box.vm.network "forwarded_port", guest: 80, host: 80
        end
        box.vm.provider "virtualbox" do |v|
          v.memory = boxconfig[:memory]
          v.cpus = boxconfig[:cpus]
        end
        
        box.vm.provision "shell", path: "./step1.sh"

      end
    end
  end

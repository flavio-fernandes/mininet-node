# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provision "shell", path: "puppet/scripts/bootstrap.sh"

  # ip configuration
  mininet_ip = "192.168.50.15"

  config.vm.define "mininet-node" do |mininet|
    mininet.vm.box = "trusty64"
    mininet.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    mininet.vm.provider "vmware_fusion" do |v, override|
      override.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-14.04_chef-provisionerless.box"
    end
    mininet.vm.hostname = "mininet"
    ## mininet.vm.network "private_network", ip: "#{mininet_ip}"
    mininet.vm.provider :virtualbox do |vb|
      vb.memory = 1024
    end
    mininet.vm.provider "vmware_fusion" do |vf|
      vf.vmx["memsize"] = "1024"
    end
    mininet.vm.provision "puppet" do |puppet|
      puppet.working_directory = "/vagrant/puppet"
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "mininet.pp"
    end
  end

end

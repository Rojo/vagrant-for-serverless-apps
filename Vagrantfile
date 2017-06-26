
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'centos/7'
  config.vm.define 'serverless-dev'

  # Forward ports
  [].each do |p|
    config.vm.network :forwarded_port, guest: p, host: p
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # If you are using Windows o Linux with an encrypted volume
  config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  # If you're using OS X or Linux (not encrypted)
  # NFS ---- NFS improves speed of VM if supported by your OS
  # config.vm.network 'private_network', ip: '192.168.50.4'
  # config.vm.synced_folder '.', '/vagrant', type: 'nfs'

  # Provision application
  # config.vm.provision "shell", privileged: false, run: "always",
  #   path: "bin/setup_box.sh"
end

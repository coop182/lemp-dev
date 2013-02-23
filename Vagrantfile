require 'erb'

Vagrant::Config.run do |config|

  # Define box to use
  config.vm.box = "devbox"
  # URL of box to use if it has not been downloaded yet
  config.vm.box_url = "https://github.com/downloads/roderik/VagrantQuantal64Box/quantal64.box"

  # Default host
  config.vm.host_name = "lempdev.localhost"
  # Other hosts to setup
  if File.exist?("host-aliases")
     aliases = File.open("host-aliases", "rb").read
     config.hosts.aliases = aliases.gsub("\n", " ")
  end

  # IP Address of the server
  config.vm.network :hostonly, "192.168.33.11"

  #config.vm.network :bridged
  #config.vm.boot_mode = :gui

  # Port forwards (vm, local)
  #config.vm.forward_port 80, 8080
  #config.vm.forward_port 3000, 3000

  #config.vm.customize ["modifyvm", :id, "--memory", 1024]

  # Enable provisioning through a shell script.
  config.vm.provision :shell do |shell|
    relative     = ''
    script       = 'bin/provision.sh'
    shell.inline = ERB.new("<% def import(file); File.read('#{relative}' + file); end %>" + File.read("#{relative}#{script}")).result
  end

end

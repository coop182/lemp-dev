Vagrant/Ubuntu LEMP environment for OSX
============================================

Vagrant development environment provisioned with shell scripts on a (linux/ubuntu) quantal64 box.

## Setup Instructions

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
2. Install [Vagrant](http://downloads.vagrantup.com/) - version 1.0.6 or above.
3. Install [Git](http://git-scm.com/downloads)
4. Clone `https://github.com/coop182/lemp-dev.git` to your computer.
5. Add any host names you want setup into `host-aliases-example` (one per line) and rename it to `host-aliases`
5. Double click `start-server.app` - the first run will take a while, it may launch a terminal window which needs administrator access so it can update your hosts file.
6. Browse to [http://lempdev.localhost](http://dev.localhost) in the browser of your choice, it should resolve.

## Credits and info

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com/)
* [Git](http://git-scm.com/)
* [Vagrant-dev-env](https://github.com/pixelhandler/vagrant-dev-env) by Bill Heaton
* [Unbuntu.sh](https://github.com/StanAngeloff/vagrant-shell-scripts) by StanAngeloff
* [Vagrant Boxes](http://www.vagrantbox.es)
* [Provision with shell](http://vagrantup.com/v1/docs/provisioners/shell.html)
* [Host Only Networking](http://vagrantup.com/v1/docs/host_only_networking.html)
* [Bridged Newtworking](http://vagrantup.com/v1/docs/bridged_networking.html)
* [VisualPharm](http://www.visualpharm.com/) for Server Icon
* [Platypus](http://sveinbjorn.org/platypus) for App creation
* [vagrant-hostmaster](https://github.com/mosaicxm/vagrant-hostmaster)

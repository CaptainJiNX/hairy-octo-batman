VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"

	config.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 4
	end

	config.vm.provision "shell", inline: "mkdir -p /var/elasticsearch"

	config.vm.provision "docker" do |d|
		d.build_image "/vagrant/jinx-elasticsearch", args: "-t jinx/elasticsearch"
		d.build_image "/vagrant/jinx-nodejs", args: "-t jinx/nodejs"
		d.run "jinx/elasticsearch", args: "-v /var/elasticsearch:/data"
		d.run "jinx/nodejs", args: "-p 8080:8080 --link jinx-elasticsearch:db"
	end

	config.vm.network "forwarded_port", guest: 8080, host: 8080
end

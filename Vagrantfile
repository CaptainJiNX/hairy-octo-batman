VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"

	config.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 4
	end

	config.vm.provision "shell", inline: "rm -fr /var/elasticsearch"
	config.vm.provision "shell", inline: "mkdir /var/elasticsearch"
	config.vm.provision "shell", inline: "cp /vagrant/elasticsearch.yml /var/elasticsearch"

	config.vm.provision "docker" do |d|

		# TODO: Fix image with working Marvel...
		# d.build_image "/vagrant", args: "-t jinx/elasticsearch"
		# d.run "jinx/elasticsearch",

		d.run "dockerfile/elasticsearch", 
			args: "-p 9200:9200 -p 9300:9300 -v /var/elasticsearch:/data",
			cmd: "/elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml"
	end

	config.vm.network "forwarded_port", guest: 9200, host: 9200
	config.vm.network "forwarded_port", guest: 9300, host: 9300
end

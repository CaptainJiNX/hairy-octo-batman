VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.define "es" do |es|
		es.vm.provider "docker" do |d|
			d.name = "jinx-elasticsearch"
			d.build_dir = "./jinx-elasticsearch"
			d.has_ssh = true
		end
	end

	config.vm.define "app" do |app|
		app.vm.synced_folder "./source", "/opt/app"
		app.vm.provision "shell", inline: "cd /opt/app && npm install"
		app.vm.provider "docker" do |d|
			d.build_dir = "./jinx-nodejs"
			d.has_ssh = true
			d.link "jinx-elasticsearch:db"
			d.ports = ["8080:8080"]
		end
	end

end

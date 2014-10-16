ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
DOCKER_HOST_NAME = "dockerhost"
DOCKER_HOST_VAGRANTFILE = "./DockerHostVagrantfile"

Vagrant.configure("2") do |config|

	config.vm.define "elasticsearch" do |es|

		es.vm.synced_folder "./data", "/data"

		es.vm.provider "docker" do |d|
			d.name = "jinx-elasticsearch"
			d.build_dir = "./jinx-elasticsearch"
			d.build_args = ["-t=jinx/elasticsearch"]
			d.remains_running = true
			d.vagrant_machine = "#{DOCKER_HOST_NAME}"
			d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
		end
	end

	config.vm.define "app" do |app|

		app.vm.synced_folder "./source", "/usr/local/src"

		app.vm.provider "docker" do |d|
			d.name = "jinx-nodejs"
			d.build_dir = "./jinx-nodejs"
			d.build_args = ["-t=jinx/nodejs"]
			d.link "jinx-elasticsearch:db"
			d.ports = ["8080:8080"]
			d.remains_running = true
			d.vagrant_machine = "#{DOCKER_HOST_NAME}"
			d.vagrant_vagrantfile = "#{DOCKER_HOST_VAGRANTFILE}"
			d.cmd = ["forever", "-w", "index.js"]
		end
	end

end

Vagrant.configure("2") do |config|

  #
  # Environment Variables
  #
  SCRIPT_FOLDER  = "./scripts"
  IMAGE_NAME     = "aruns1975/spark-3.2.1"
  IMAGE_VERSION  = "1.0"

  MACHINE_NAME   = "spark-master-node"
  MACHINE_IP    = "10.1.0.100"

  WORKER_COUNT =2 
  WORKER_NODE_PREFIX = "spark-worker-node-"
  WORKER_NODE_IP_PREFIX = "10.1.0.10"

  #
  # Creations of user and installation of java, scala and git
  #
  #config.vm.provision "shell", path: "#{SCRIPT_FOLDER}/create_user.sh"
  #config.vm.provision "shell", path: "#{SCRIPT_FOLDER}/install_base_softwares.sh"
  #config.vm.provision "shell", path: "#{SCRIPT_FOLDER}/install_spark.sh"

  config.vm.provision "shell", path: "#{SCRIPT_FOLDER}/create_user.sh"
  config.vm.provision "shell", inline: <<-SHELL
      echo "127.0.0.1       localhost" > /etc/hosts
      echo " " >> /etc/hosts
      echo "# The following lines are desirable for IPv6 capable hosts"  >> /etc/hosts
      echo "::1     ip6-localhost   ip6-loopback" >> /etc/hosts
      echo "fe00::0 ip6-localnet" >> /etc/hosts
      echo "ff00::0 ip6-mcastprefix" >> /etc/hosts
      echo "ff02::1 ip6-allnodes" >> /etc/hosts
      echo "ff02::2 ip6-allrouters" >> /etc/hosts
      echo "ff02::3 ip6-allhosts" >> /etc/hosts
      #echo "127.0.1.1  spark-master-node spark-master-node" >> /etc/hosts
      echo " " >> /etc/hosts
      echo "10.1.0.100  spark-master-node" >> /etc/hosts
      echo "10.1.0.101  spark-worker-node-1" >> /etc/hosts
      echo "10.1.0.102  spark-worker-node-2" >> /etc/hosts
  SHELL
  #
  # Master node configuration
  #
  config.vm.define "#{MACHINE_NAME}" do |master|
    master.vm.box = IMAGE_NAME
    master.vm.box_version = IMAGE_VERSION
    master.vm.hostname = "#{MACHINE_NAME}"
    master.vm.network "private_network", ip: MACHINE_IP
    master.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 1
        vb.name="#{MACHINE_NAME}"
    end

   #     master.vm.provision "shell", path: "#{SCRIPT_FOLDER}/stop_spark_server.sh"
    master.vm.provision "shell", path: "#{SCRIPT_FOLDER}/start_spark_server.sh"
  end
  

  #
  # Worker node configuration
  #
  (1..WORKER_COUNT).each do |i|
    config.vm.define "#{WORKER_NODE_PREFIX}#{i}" do |node|
      node.vm.box = IMAGE_NAME
      node.vm.box_version = IMAGE_VERSION
      node.vm.hostname = "#{WORKER_NODE_PREFIX}#{i}"
      node.vm.network "private_network", ip: "#{WORKER_NODE_IP_PREFIX}#{i}"
      node.vm.provider "virtualbox" do |vb|
          vb.memory = 2048
          vb.cpus = 2
          vb.name="#{WORKER_NODE_PREFIX}#{i}"
      end
  #    node.vm.provision "shell", path: "#{SCRIPT_FOLDER}/stop_spark_server.sh"
      node.vm.provision "shell", path: "#{SCRIPT_FOLDER}/start_worker.sh"
    end 
  end
end
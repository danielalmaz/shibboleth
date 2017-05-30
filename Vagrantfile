Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vbguest.auto_update = false

   config.vm.define "idp" do |idp|
    idp.vm.box = "bento/centos-7.2"
    idp.vm.hostname = 'idp'
    
    idp.vm.network :private_network, ip: "192.168.56.103"
    idp.vm.network :forwarded_port, guest: 22, host: 10222, id: "ssh"
    idp.vm.network :forwarded_port, guest: 80, host: 18080, id: "apache"
    idp.vm.network :forwarded_port, guest: 8080, host: 18081, id: "tomcat"

    idp.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1048]
      v.customize ["modifyvm", :id, "--name", "idp"]
   end	
 
    idp.vm.provision "shell", path: "scripts/bootstrap.sh"
    idp.vm.provision "shell", path: "scripts/modJK.sh"
    idp.vm.provision "shell", path: "scripts/idp.sh"

	idp.vm.provision "file", source: "files/login.conf", destination: "/etc/httpd/conf.d/login.example.com.conf"
    idp.vm.provision "file", source: "files/server.xml", destination: "/usr/local/apache-tomcat-8/conf/server.xml"
    idp.vm.provision "file", source: "files/mod_jk.conf", destination: "/etc/httpd/conf.d/mod_jk.conf"
    idp.vm.provision "file", source: "files/workers.properties" , destination: "/etc/httpd/conf/workers.properties"
    idp.vm.provision "file", source: "files/sp.conf", destination: "/etc/httpd/conf.d/sp.conf"
    idp.vm.provision "file", source: "files/ssl.conf", destination: "/etc/httpd/conf.d/ssl.conf"
    
    
  end   
end	





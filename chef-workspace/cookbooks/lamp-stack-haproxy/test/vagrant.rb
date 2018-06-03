Vagrant.configure(2) do |config|
    config.vm.provision "shell", inline: <<-SHELL
    #create 2 simple servers using netcat
    (while true; do { echo -e 'HTTP/1.1 200 OK\r\n'; echo '<h1>Hello World!</h1><br/><h2>Port 8181</h2>'; } | nc -lp 8181; done) &>/dev/null &
    (while true; do { echo -e 'HTTP/1.1 200 OK\r\n'; echo '<h1>Hello World!</h1><br/><h2>Port 8182</h2>'; } | nc -lp 8182; done) &>/dev/null &
    SHELL
  end
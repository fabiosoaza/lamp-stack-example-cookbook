Vagrant.configure(2) do |config|
    config.vm.provision "shell", inline: <<-SHELL
    HOST="192.168.33.14"
    DB="custom_database"
    PORT="3306"
    USER="yet_another_admin"
    PASSWORD="yet_another_password"

    #mysql -h 192.168.33.14-uyet_another_admin -pyet_another_password -Dcustom_database --port=3306 -e "show databases;"

    mysql -h $HOST -u$USER -p$PASSWORD -D$DB --port=$PORT -e <<SQL
        insert into clients (id, first_name, last_name, email) values (uuid(), 'John', 'Doe', 'john.doe@fakedomain.com');
        insert into clients (id, first_name, last_name, email) values (uuid(), 'Jane', 'Doe', 'jane.doe@fakedomain.com');
    SQL  
    
    SHELL
  end



include_recipe 'lamp-stack-mysql::default'

create_tables = ::File.join(Chef::Config[:file_cache_path], 'create-table.sql')

#run when file is modified
cookbook_file create_tables  do
    source 'create-table.sql'
end

execute "initialize #{node['lamp']['database']['dbname']} database" do
    command "mysql -h #{node['lamp']['database']['host']} -u #{node['lamp']['database']['admin_username']} -p#{node['lamp']['database']['admin_password']} -D #{node['lamp']['database']['dbname']} --port #{node['lamp']['database']['port']} < #{create_tables}" 
    not_if  "mysql -h #{node['lamp']['database']['host']} -u #{node['lamp']['database']['admin_username']} -p#{node['lamp']['database']['admin_password']} -D #{node['lamp']['database']['dbname']} --port #{node['lamp']['database']['port']} -e 'describe clients;'"
end
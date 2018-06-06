#
# Cookbook:: lamp-stack-mysql
# Recipe:: database
#
# Copyright:: 2018, The Authors, All Rights Reserved.
 mysql_connection_info = {
     host: node['lamp']['database']['host'] ,
     username: node['lamp']['database']['root_username'],
     password: node['lamp']['database']['root_password']
 }

mysql_client 'default' do
  action :create
 end

mysql_service 'default' do   
    port node['lamp']['database']['port'] 
    bind_address '0.0.0.0'
    initial_root_password node['lamp']['database']['root_password']
    action [:create, :start]
end


 mysql2_chef_gem 'default' do
     action :install
 end

 mysql_database node['lamp']['database']['dbname'] do
   connection mysql_connection_info
   action :create
 end

 mysql_database_user node['lamp']['database']['admin_username'] do
     connection mysql_connection_info 
     password node['lamp']['database']['admin_password'] 
     database_name node['lamp']['database']['dbname'] 
     host '%' 
     privileges    [:all]
     action [:create, :grant]
 end



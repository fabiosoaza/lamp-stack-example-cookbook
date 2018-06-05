#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "apache2"
include_recipe "apache2::mod_php" 

package_lib = node[:platform_family].include?("debian") ? 'libapache2-mod-php' : 'php'

directory node['lamp']['web']['document_root'] do
  recursive true
end

web_app node['lamp']['web']['app_name'] do  
  server_name node['lamp']['web']['server_name']
  docroot  node['lamp']['web']['document_root']
  template 'default.conf.erb' 
  log_dir node['apache']['log_dir'] 
end

package 'php-mysql' do
  action :install  
end


template "#{node['lamp']['web']['document_root']}/index.php" do
  source 'index.php.erb'
end

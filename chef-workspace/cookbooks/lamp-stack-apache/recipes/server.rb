#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

service_name = node[:platform_family].include?("debian") ? 'apache2' : 'httpd'

directory node['lamp']['web']['document_root'] do
  recursive true
end

httpd_config 'default' do 
  source 'default.conf.erb'
end

httpd_service 'default' do
mpm 'prefork'
action [:create, :start]
subscribes :restart, 'httpd_config[default]'
end

httpd_module 'php7' do 
  instance 'default'
  package_name 'php'
end

package 'php-mysql' do
  action :install
  notifies :restart, 'httpd_service[default]'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service service_name do
  action [:restart, :enable]
end
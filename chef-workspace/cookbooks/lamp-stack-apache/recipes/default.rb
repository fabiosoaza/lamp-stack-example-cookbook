#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
apt_update 'daily' do
    frequency 86_400
    action :periodic
 end
  

include_recipe 'lamp-stack-apache::server'

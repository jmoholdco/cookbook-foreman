#
# Cookbook Name:: foreman
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#

include_recipe 'foreman::firewall_rules'

cookbook_file '/etc/pki/tls/certs/ca.pem' do
  source 'ca.pem'
  owner 'root'
  group node['root_group']
  mode '0644'
  action :create
end

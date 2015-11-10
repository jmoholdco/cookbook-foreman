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

# ca_certificate 'Foreman CA' do
#   ca_path '/etc/pki/CA'
#   organization 'JML Holdings, LLC'
#   organizational_unit 'Foreman CA'
#   state 'Colorado'
#   city 'Denver'
#   common_name 'JML Foreman CA'
#   type 'intermediate'
#   key_password chef_vault_item('foreman', 'ca_password')['password']
# end

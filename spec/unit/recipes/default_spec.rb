#
# Cookbook Name:: foreman
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'foreman::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates the ca cert' do
      expect(chef_run).to create_ca_certificate('Foreman CA').with(
        common_name: 'JML Foreman CA',
        type: 'intermediate'
      )
    end

    it 'includes the firewall recipe' do
      expect(chef_run).to include_recipe 'foreman::firewall_rules'
    end
  end
end

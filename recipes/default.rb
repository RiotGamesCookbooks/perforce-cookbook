#
# Cookbook Name:: perforce
# Recipe:: default
#
# Author:: Josiah Kiehl <josiah@bluepojo.com>
#
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'homebrew'

package 'perforce'

directory node[:p4][:workspace_path]

template "#{node[:p4workspace_path]}/.p4config" do
  owner node[:user]
  group node[:group]
  variables node[:p4]
end

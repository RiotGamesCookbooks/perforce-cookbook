#
# Cookbook Name:: perforce
# Recipe:: linux
#
# Author:: Kyle Allan (<kallan@riotgames.com>)
#
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#
directory node[:p4][:install_dir] do
  recursive true
end

perforce_p4 "12.1" do
  directory node[:p4][:install_dir]
  sixty_four node[:kernel][:machine] == "x86_64"
end
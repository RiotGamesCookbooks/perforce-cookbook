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
perforce_p4 "12.1" do
  directory "/var/tmp"
  sixty_four true
end
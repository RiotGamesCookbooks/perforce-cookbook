#
# Cookbook Name:: perforce
# Resource:: p4
#
# Author:: Kyle Allan <kallan@riotgames.com>
#
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#
action :install
default_action :install

attribute :version, :kind_of => String, :required => true, :name_attribute => true
attribute :directory, :kind_of => String, :required => true
attribute :sixty_four, :kind_of => [TrueClass, FalseClass], :default => false, :required => true
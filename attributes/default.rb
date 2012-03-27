#
# Cookbook Name:: perforce
# Attribute:: default
#
# Author:: Josiah Kiehl <josiah@bluepojo.com>
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#

default[:user]             = 'jkiehl' # will be node attributes
default[:group]            = 'staff'

default[:p4][:workspace_path] = "/Users/#{default[:user]}/p4workspace/"

default[:p4][:port]           = nil # environment attribute

default[:p4][:user]           = default[:user]
default[:p4][:passwd]         = nil

default[:p4][:diff]           = nil
default[:p4][:editor]         = nil
default[:p4][:merge]          = nil

default[:p4][:client]         = nil

default[:p4][:charset]        = nil
default[:p4][:commandcharset] = nil
default[:p4][:language]       = nil 
default[:p4][:host]           = nil

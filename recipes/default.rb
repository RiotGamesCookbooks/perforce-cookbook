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

home_path = File.join("/Users", node[:owner])
p4config_path = File.join(home_path, '.p4config')

template p4config_path do
  owner     node[:owner]
  group     node[:group]
  variables node[:p4]
end

source_p4config_line = "source ~/.p4config"

ruby_block 'source .p4config in .bash_profile' do
  block do
    File.open(File.join(home_path, '.bash_profile'), 'a') do |file|
      file.puts source_p4config_line
    end
  end

  not_if do
    begin
      File.open(File.join(home_path, '.bash_profile'), 'r') do |file|
        !!(file.readlines.join(' ') =~ /#{source_p4config_line}/)
      end
    rescue Errno::ENOENT
      false
    end
  end
end

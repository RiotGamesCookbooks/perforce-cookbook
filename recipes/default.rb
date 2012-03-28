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

p4 = node[:p4]
user_data = node[:etc][:passwd][p4[:owner]]
home_dir_path = user_data[:dir]
p4config_path = File.join home_dir_path, p4[:config_filename]
shellrc_path = File.join home_dir_path, case user_data[:shell]
                                        when '/bin/bash'
                                          '.bash_profile'
                                        when '/bin/zsh'
                                          '.zshrc'
                                        end

set_p4config_line = "p4 set P4CONFIG=#{p4config_path}"

template p4config_path do
  owner     node[:owner]
  group     node[:group]
  variables p4
end

# set perforce config

ruby_block 'set P4CONFIG in shell rc file' do
  block do
    File.open(shellrc_path, 'a+') do |file|
      file.puts set_p4config_line
    end
  end

  not_if do
    begin
      # TODO detect shell
      File.open(shellrc_path) do |file|
        !!(file.readlines.join("\n") =~ /#{set_p4config_line}/)
      end
    rescue Errno::ENOENT
      false
    end
  end
end

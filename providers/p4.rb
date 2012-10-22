#
# Cookbook Name:: perforce
# Provider:: p4
#
# Author:: Kyle Allan <kallan@riotgames.com>
#
# Copyright 2012, Riot Games
#
# All rights reserved - Do Not Redistribute
#
def load_current_resource
    @current_resource = Chef::Resource::PerforceP4.new(new_resource.name)
    @current_resource.directory new_resource.directory
end

action :install do
  unless ::File.exists?("#{@current_resource.directory}/p4")
    p4_ftp.chdir("perforce/#{get_complete_p4_path}")
    downloadable = node[:os] == "windows" ? "p4.exe" : "p4"

    p4_ftp.getbinaryfile(downloadable, new_resource.directory)
    p4_ftp.close
  end
end

private

def p4_ftp
  require 'net/ftp'
  return @ftp if @ftp
  @ftp = Net::FTP.new('ftp.perforce.com')
  @ftp.login
  @ftp
end

def get_complete_p4_path
  "r#{new_resource.version}/#{get_p4_os_directory}"
end

def get_p4_os_directory
  architecture = new_resource.sixty_four ? "x86_64" : "x86"
  case node[:os]
  when "linux"
    os = "linux26#{architecture}"
  when "darwin"
    os = "darwin90#{architecture}"
  when "windows"
    architecture = new_resource.sixty_four ? "x64" : "x86"
    os = "nt#{architecture}"
  end
  "bin.#{os}"
end
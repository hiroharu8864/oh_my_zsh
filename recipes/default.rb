#
# Cookbook Name:: oh-my-zsh
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
# All rights reserved - Do Not Redistribute
#
%w{zsh git}.each do |pkg|
  package pkg do
    action :install
  end
end

git node['zsh_user']['home'] + "/.oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :checkout
  user node['zsh_user']['name']
  group node['zsh_user']['name']
end

template node['zsh_user']['home']  + "/.zshrc" do
  source "zshrc.erb"
  owner node['zsh_user']['name']
  mode "0644"
  action :create_if_missing
  variables({
    :theme    => node[:oh_my_zsh][:theme] || 'robbyrussell',
    :case_sensitive =>  node[:oh_my_zsh][:case_sensitive] || false,
    :plugins  => node[:oh_my_zsh][:plugins] || %w(git)
  })
end

user node['zsh_user']['name'] do
  action :modify
  shell '/bin/zsh'
end

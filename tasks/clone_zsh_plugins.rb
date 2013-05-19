#!/usr/bin/env ruby

require 'pathname'

plugin_dir = Pathname.new(ENV['ZDOTDIR'] || ENV['HOME'])
plugin_dir += "repository"

unless File.directory?(plugin_dir)
  puts "Plugin dir (#{plugin_dir}) not exists."
  abort
end

PLUGINS = {
  "zaw"                          => 'git://github.com/zsh-users/zaw.git',
  "zsh-history-substring-search" => 'git://github.com/zsh-users/zsh-history-substring-search.git',
  "vim-gitdiffall"               => 'git://github.com/bootleq/vim-gitdiffall.git'
}

print "Install plugin repositories into #{plugin_dir}? (y/n) "
STDOUT.flush
if STDIN.gets.chomp != 'y'
  puts "Aborted."
  abort
end

PLUGINS.each do |name, repo|
  install_dir = Pathname.new(plugin_dir) + name
  if File.directory?(install_dir)
    puts "\n'#{name}' exists."
  else
    puts "\n'#{name}' installing..."
    %x(git clone #{repo} #{install_dir})
  end
end

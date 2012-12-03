require 'rake'
verbose false

#########################################
# Global vars and setup
#########################################
$home = ENV['HOME']
$installers = "#{$home}/.dothome/installers"
# if File.expand_path(File.dirname( __FILE__ )) != "#{$home}/.dothome"
#   abort "For this to work, we should be located in ~/.dothome"
# end
$dotfiles_github_user = ENV['USER']
$dotfiles_github_repo = "dotfiles"
$dotfiles_uri = "https://github.com/#{$dotfiles_github_user}/#{$dotfiles_github_repo}.git"


#########################################
# Global methods
#########################################

# A common pattern for my scripts.  Check if a specific directory exists.  If not,
# clone it from a git repository.  But first, recursively create any parent directories
# for the path.
def subdir_clone( directory, name, git_repo )
  if not File.directory? "#{directory}/#{name}"
    FileUtils.mkdir_p directory
    sh "git clone #{git_repo} '#{directory}/#{name}'"
  end
end

# Cross-platform way of finding an executable in the $PATH.
# idea taken from http://bit.ly/qDaTbY
#
#   which('ruby') #=> /usr/bin/ruby
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = "#{path}/#{cmd}#{ext}"
      return exe if File.executable? exe
    }
  end
  return nil
end

#########################################
# Default task
#########################################
task :default => [ 'dotfiles:install' ]
task :bootstrap =>  [
                      'homebrew:install',
                      'git:install',
                      # 'python:install',
                      # 'ruby:install',
                      # 'node:install',
                      'zsh:install',
                      'vim:install',
                      'dotfiles:install'
                      #'solarized:install', #TODO: janus handles this now? not for apple color picker tho
                    ]
task :update =>     [
                      'dotfiles:update',
                      'homebrew:brew_upgrade',
                      'ruby:rvm_update',
                      'node:npm_update',
                      'vim:janus_update',
                      'git:update_scmbreeze'
                    ]


require 'rake'
verbose false

#########################################
# Global vars and setup
#########################################
$home = ENV['HOME']
$installers = "#{$home}/.dothome/installers"


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
task :default    =>  [:update]
task :bootstrap  =>  ['bootstrap:all']
namespace :bootstrap do
  task :all      =>  [:software, :extras, :configuration]
  task :software =>  ['cookbooks:converge', :extras]
  task :extras   =>  [
                      # now handled in cookbooks: homebrew, ruby, node
                      # purposefully disabled for now: python, solarized
                      'git:install',
                      'zsh:install',
                      'vim:install'
                     ]
  task :config   =>  ['dotfiles:install']
end
task :update =>     [
                      'dotfiles:update',
                      'homebrew:update',
                      'ruby:update',
                      'node:update',
                      'vim:update',
                      'git:update',
                      'zsh:update'
                    ]


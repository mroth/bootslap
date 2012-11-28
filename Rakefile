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


#########################################
# Default task
#########################################
task :default => [ 'dotfiles:install' ]
task :bootstrap =>  [
                      'dotfiles:install',
                      'homebrew:install',
                      'git:install',
                      'python:install',
                      'ruby:install',
                      'node:install',
                      'zsh:install',
                      'vim:install'
                      #'textmate:install', #should be no longer needed with textmate2.. or at least needs to be updated
                      #'solarized:install', #TODO: janus handles this now? not for apple color picker tho
                      #'bitly:install' #TODO: update to mermanify script before reactivating
                    ]
task :update =>     [
                      'dotfiles:install',
                      'homebrew:brew_upgrade',
                      'ruby:rvm_update',
                      'node:npm_update',
                      'vim:janus_update',
                      'git:update_scmbreeze'
                    ]

#########################################
# Main dotfiles installer
#########################################
namespace :dotfiles do
  desc "install dotfiles"
  task :install do

    FileList["#{$home}/.dothome/dotfiles/*"].each do |file|
    
      base = File.basename(file)
      target = File.join($home, ".#{base}")
      src = ".dothome/dotfiles/#{base}"
    
      next if %w[README.md Rakefile].include? base
      next if not File.file? file
    
      if File.symlink? target and (File.readlink(target) == src)
        puts "*** ~/.#{base} already symlinked properly" #lets not spam on this now since this will be a prereq for a lot of things
      elsif File.symlink? target
        #symlinked but to the wrong place (e.g. I moved directory structure for bootstrapper)
        #just resymlink to repair
        puts "+++ symlink moved, re-linking ~/.#{base}"
        FileUtils.ln_s(src, target, :force => true)
      elsif File.exist? target
        puts "!!! backing up existing ~/.#{base} to ~/.#{base}.old "
        FileUtils.mv(target,"#{target}.old")
        puts "+++ linking ~/.#{base}"
        File.symlink(src, target)
      else
        puts "+++ linking ~/.#{base}"
        File.symlink(src, target)
      end
    end
  end
  
  desc "uninstall dotfiles, restoring whatever existed before"
  task :uninstall do
    abort "...not implemented yet, sorry!"
    #TODO: remove symlinks
    #TODO: restore .old files if they exist
  end
end


# desc "setup dirs"
# task :dirs do |t|
#   %w[tmp src].each do |d|
#     if not File.directory? "#{$home}/#{d}"
#       puts "dir  ~/#{d}"
#       FileUtils.mkpath "#{$home}/#{d}"
#     end
#   end
# end  

# desc "setup mac stuff"
# task :mac do |t|
#   if RUBY_PLATFORM.include?("darwin")
#     
#     # hide unixy stuff from finder
#     sh "chflags hidden ~/var ~/tmp ~/bin"
#     
#     # graphite, won't take effect until apps are restarted
#     # in theory you could send a NSControlTintDidChangeNotification but that's too much work
#     sh "defaults write -g AppleAquaColorVariant -int 6"
#     
#   end
# end

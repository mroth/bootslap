home = ENV['HOME']
if File.expand_path(File.dirname( __FILE__ )) != "#{home}/.dothome"
  abort "For this to work, we should be located in ~/.dothome"
end

require 'rake'
verbose true

# $LOAD_PATH << './rake'
# load 'homebrew.rake'
# load 'ruby.rake'

# lets split this up across a bunch of files to make things easier to organize
# load any files in the rake/* dir
Dir["rake/*.rb"].each {|file| load file }

task :default => [ 'dotfiles:install' ]


namespace :dotfiles do
  desc "install dotfiles"
  task :install do

    FileList["#{home}/.dothome/*"].each do |file|
    
      base = File.basename(file)
      target = File.join(home, ".#{base}")
      src = ".dothome/#{base}"
    
      next if %w[README.md Rakefile].include? base
      next if not File.file? file
    
      if File.symlink? target and (File.readlink(target) == src)
        puts "*** ~/.#{base} already symlinked properly"
      elsif File.symlink? target or File.exist? target
        puts "!!! backing up existing ~/.#{base} to ~/.#{base}.old "
        FileUtils.mv(target,"#{target}.old")
        puts "+++ linking ~/.#{base}"
        File.symlink(src, target);
      else
        puts "+++ linking ~/.#{base}"
        File.symlink(src, target);
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

desc "install solarized color scheme (iterm2,vim,textmate,others?)"
task :solarized do
  #get most recent version of files
  if not File.directory? "#{home}/Downloads/solarized"
    sh "git clone git://github.com/altercation/solarized.git ~/Downloads/solarized"
  end
  sh "cd ~/Downloads/solarized; git pull;"
  
  #install for vim
  sh "mkdir -p ~/.vim/colors"
  sh "cp ~/Downloads/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors"
end

# desc "setup ssh"
# task :ssh => FileList['ssh/*', "#{home}/.dothome_private/ssh/*"] do |t|
#   if not File.directory? "#{home}/.ssh"
#     puts "dir  ~/.ssh"
#     FileUtils.mkpath "#{home}/.ssh"
#   end
#   puts "make ~/.ssh/config"
#   sh "echo '\# reminder: this file is generated from ~/.dothome/ssh' > ~/.ssh/config"
#   sh "cat #{t.prerequisites.join(' ')} >> ~/.ssh/config"  
# end
# 
# desc "setup git config"
# task :git => FileList['git/*', "#{home}/.dothome_private/git/*"] do |t|
#   puts "make ~/.dothome/gitconfig"
#   sh "echo '\# reminder: this file is generated from .dothome/git' > ~/.dothome/gitconfig"
#   sh "cat #{t.prerequisites.join(' ')} >> ~/.dothome/gitconfig"  
# end
# 
# desc "setup dirs"
# task :dirs do |t|
#   %w[tmp src].each do |d|
#     if not File.directory? "#{home}/#{d}"
#       puts "dir  ~/#{d}"
#       FileUtils.mkpath "#{home}/#{d}"
#     end
#   end
# end  

desc "setup mac stuff"
task :mac do |t|
  if RUBY_PLATFORM.include?("darwin")
    
    # # hide unixy stuff from finder
    # sh "chflags hidden ~/var ~/tmp ~/bin"
    # 
    # # set up the dock
    # sh "defaults write com.apple.dock tilesize -int 18" # small
    # sh "defaults write com.apple.dock largesize -int 32" # little bit of magnification if it was turned on
    # sh "defaults write com.apple.dock magnification -bool no"
    # sh "defaults write com.apple.dock autohide -bool no"
    # sh "defaults write com.apple.dock pinning -string end" # on the right pls
    # sh "defaults write com.apple.dock orientation -string bottom" # at the bottom
    # sh "defaults write com.apple.dock showhidden -bool true"
    # sh "defaults write com.apple.dock no-glass -boolean YES"
    # sh "defaults write com.apple.dock minimize-to-application -boolean YES"
    # 
    # # screen saver
    # sh "defaults write com.apple.dock wvous-bl-corner -int 5"
    # sh "defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Arabesque path '/System/Library/Screen Savers/Arabesque.qtz' type 1"
    # 
    # # background
    # sh %q{osascript -e 'tell application "System Events" to set picture of item 2 of every desktop to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"'}
    # sh %q{osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"'}
    # 
    # sh "killall Dock"
    # 
    # # set up the terminal
    # sh "open ~/.dothome/mac/ph.terminal"
    # sh "sleep 1"
    # sh %q{osascript -e 'tell application "Terminal" to set default settings to settings set "ph"'}
    # sh %q{osascript -e 'tell application "Terminal" to set startup settings to settings set "ph"'}
    
    # graphite, won't take effect until apps are restarted
    # in theory you could send a NSControlTintDidChangeNotification but that's too much work
    sh "defaults write -g AppleAquaColorVariant -int 6"
    
  end
end
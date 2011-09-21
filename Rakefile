
home = ENV['HOME']
if File.expand_path(File.dirname( __FILE__ )) != "#{home}/.dothome"
  abort "dothome should be in ~/.dothome"
end

require 'rake'
verbose false

task :default => [:dotfiles]

desc "install rvm and ruby 1.9.2"
task :ruby do
  sh "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
  sh "rvm install 1.9.2"
  sh "rvm use ruby-1.9.2"
  sh "rvm --default use 1.9.2"
  sh "gem install rails bundler sqlite3"
end

desc "install dotfiles"
task :dotfiles do

  FileList["#{home}/.dothome/*"].each do |file|
    
    base = File.basename(file)
    target = File.join(home, ".#{base}")
    src = ".dothome/#{base}"
    
    next if %w[README Rakefile].include? base
    next if not File.file? file
    
    if File.symlink? target and (File.readlink(target) == src)
    
    elsif File.symlink? target or File.exist? target
      puts "skip ~/.#{base}"
    else
      puts "link ~/.#{base}"
      File.symlink(src, target);
    end
  end
end

desc "setup ssh"
task :ssh => FileList['ssh/*', "#{home}/.dothome_private/ssh/*"] do |t|
  if not File.directory? "#{home}/.ssh"
    puts "dir  ~/.ssh"
    FileUtils.mkpath "#{home}/.ssh"
  end
  puts "make ~/.ssh/config"
  sh "echo '\# reminder: this file is generated from ~/.dothome/ssh' > ~/.ssh/config"
  sh "cat #{t.prerequisites.join(' ')} >> ~/.ssh/config"  
end

desc "setup git config"
task :git => FileList['git/*', "#{home}/.dothome_private/git/*"] do |t|
  puts "make ~/.dothome/gitconfig"
  sh "echo '\# reminder: this file is generated from .dothome/git' > ~/.dothome/gitconfig"
  sh "cat #{t.prerequisites.join(' ')} >> ~/.dothome/gitconfig"  
end

desc "setup dirs"
task :dirs do |t|
  %w[var bin tmp].each do |d|
    if not File.directory? "#{home}/#{d}"
      puts "dir  ~/#{d}"
      FileUtils.mkpath "#{home}/#{d}"
    end
  end
end  

desc "setup mac stuff"
task :mac do |t|
  if RUBY_PLATFORM.include?("darwin")
    
    # hide unixy stuff from finder
    sh "chflags hidden ~/var ~/tmp ~/bin"
    
    # set up the dock
    sh "defaults write com.apple.dock tilesize -int 18" # small
    sh "defaults write com.apple.dock largesize -int 32" # little bit of magnification if it was turned on
    sh "defaults write com.apple.dock magnification -bool no"
    sh "defaults write com.apple.dock autohide -bool no"
    sh "defaults write com.apple.dock pinning -string end" # on the right pls
    sh "defaults write com.apple.dock orientation -string bottom" # at the bottom
    sh "defaults write com.apple.dock showhidden -bool true"
    sh "defaults write com.apple.dock no-glass -boolean YES"
    sh "defaults write com.apple.dock minimize-to-application -boolean YES"

    # screen saver
    sh "defaults write com.apple.dock wvous-bl-corner -int 5"
    sh "defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Arabesque path '/System/Library/Screen Savers/Arabesque.qtz' type 1"

    # background
    sh %q{osascript -e 'tell application "System Events" to set picture of item 2 of every desktop to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"'}
    sh %q{osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"'}

    sh "killall Dock"
    
    # set up the terminal
    sh "open ~/.dothome/mac/ph.terminal"
    sh "sleep 1"
    sh %q{osascript -e 'tell application "Terminal" to set default settings to settings set "ph"'}
    sh %q{osascript -e 'tell application "Terminal" to set startup settings to settings set "ph"'}
    
    # graphite, won't take effect until apps are restarted
    # in theory you could send a NSControlTintDidChangeNotification but that's too much work
    sh "defaults write -g AppleAquaColorVariant -int 6"
    
  end
end
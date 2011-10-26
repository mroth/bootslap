namespace :ruby do

  task :install => [:rvm_install, :gems_install]

  desc "install rvm and ruby 1.9.2"
  task :rvm_install do
    # check if installed already
    if not File.exists? "#{$home}/.rvm/bin/rvm"
      puts "*** rvm not installed, installing..."
      sh "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
    else
      puts "*** rvm already installed, checking for most recent version..."
      sh "rvm get released" #upgrade to most recent released version
    end
  
    TARGET_VERSION='1.9.2'
    #TODO: don't install version if already installed?
    sh "rvm install #{TARGET_VERSION}"
    sh "rvm --default use #{TARGET_VERSION}"
    sh "gem install bundler --conservative" #make sure it's here as will use this to install fun stuff later
  end

  desc "install any rubygems from list"
  task :gems_install do
    sh "xargs gem install --conservative < gems/essential"
  end

end
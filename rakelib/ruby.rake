namespace :ruby do

  task :install => [:rvm_install, :gems_install]

  desc "Install RVM and current version of Ruby as default"
  task :rvm_install do
    # check if installed already
    if not File.exists? "#{$home}/.rvm/bin/rvm"
      puts "*** rvm not installed, installing..."
      sh "curl -L get.rvm.io | bash -s stable --ruby" #this autoinstalls current version of ruby now!
      sh "rvm reload"
    else
      #puts "*** rvm already installed, checking for most recent version..."
      sh "rvm get stable" #upgrade to most recent released version
      sh "rvm reload"
    end
  end
  
  # this task is no longer needed really since we have rvm install latest ruby
  desc "install ruby 1.9"
  task :ruby19_install => [:rvm_install] do
    TARGET_VERSION='1.9.3'
    sh "rvm install #{TARGET_VERSION}"
  end

  desc "Update RVM to latest stable version"
  task :rvm_update do
      sh "rvm get stable"
      sh "rvm reload"
  end

  desc "install any rubygems from list"
  task :gems_install do
    sh "xargs gem install --conservative < gems/essential"
  end

end

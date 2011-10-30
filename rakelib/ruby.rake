namespace :ruby do

  task :install => [:rvm_install, :gems_install]

  desc "install rvm"
  task :rvm_install do
    # check if installed already
    if not File.exists? "#{$home}/.rvm/bin/rvm"
      puts "*** rvm not installed, installing..."
      sh "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
    else
      #puts "*** rvm already installed, checking for most recent version..."
      sh "rvm get latest" #upgrade to most recent released version
    end
  end
  
  
  desc "install ruby 1.9"
  task :ruby19_install => [:rvm_install] do
    TARGET_VERSION='1.9.3-p0'
    curr_ver = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
    
    if curr_ver != TARGET_VERSION
      if curr_ver.match(/^1\.9\.\d/)
        #existing 1.9 install, upgrade it instead of installing new
        sh "rvm upgrade #{curr_ver} #{TARGET_VERSION}"
      else
        #no 1.9 version yet
        sh "rvm install #{TARGET_VERSION}"
        sh "rvm --default use #{TARGET_VERSION}"
        sh "gem install bundler --conservative" #make sure it's here as will use this to install fun stuff later
      end
    end
    
  end

  desc "install any rubygems from list"
  task :gems_install do
    sh "xargs gem install --conservative < gems/essential"
  end

end
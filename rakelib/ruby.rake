namespace :ruby do

  task :install => [:rvm_install, :ruby19_install, :gems_install]

  desc "install rvm"
  task :rvm_install do
    # check if installed already
    if not File.exists? "#{$home}/.rvm/bin/rvm"
      puts "*** rvm not installed, installing..."
      sh "curl -L get.rvm.io | bash -s stable"
    else
      #puts "*** rvm already installed, checking for most recent version..."
      sh "rvm get stable" #upgrade to most recent released version
      sh "rvm reload"
    end
  end
  
  
  desc "install ruby 1.9"
  task :ruby19_install => [:rvm_install] do
    TARGET_VERSION='1.9.3'
    sh "rvm install #{TARGET_VERSION}"

    #TARGET_VERSION='1.9.3-p0'
    ##curr_ver = "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}" #gets 1.8.7 since rake apparently runs system default instead of rvm
    #rvm_ver = `rvm list default string`
    #rvm_ver.match( /^ruby-([\d\.]+)-p(\d+)/ )
    #curr_rvm_version = $1
    #curr_rvm_patch = $2
    #curr_ver = "#{$1}-p#{$2}"
    
    #if curr_ver != TARGET_VERSION
      #if curr_rvm_version.match(/^1\.9\.\d/)
        ##existing 1.9 install, upgrade it instead of installing new
        #sh "rvm upgrade #{curr_ver} #{TARGET_VERSION}"
      #else
        ##no 1.9 version yet
        #sh "rvm install #{TARGET_VERSION}"
        #sh "rvm --default use #{TARGET_VERSION}"
        #sh "gem install bundler --conservative" #make sure it's here as will use this to install fun stuff later
      #end
    #end
    
  end

  desc "install any rubygems from list"
  task :gems_install do
    sh "xargs gem install --conservative < gems/essential"
  end

end

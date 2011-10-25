namespace :node do
  
  task :install => [:nodejs_install, :npm_install]
  
  task :nodejs_install => ['homebrew:brew_install'] do
    if not File.exists? "/usr/local/bin/node"
      sh "brew install node"
    end
  end
  
  task :nodejs_uninstall do
    sh "brew uninstall node"
  end

  task :npm_install do
    sh "curl http://npmjs.org/install.sh | sh"
  end
  
end


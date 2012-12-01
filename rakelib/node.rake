namespace :node do
  
  desc "install node.js and npm package manager, with coffeescript global"
  task :install => [:nodejs_install, :coffee_install]
  
  desc "uninstall node.js and npm"
  task :uninstall => [:coffee_uninstall, :npm_uninstall, :nodejs_uninstall]
  
  task :nodejs_install => ['homebrew:brew_install'] do
    if not File.exists? "/usr/local/bin/node"
      sh "brew install node"
    end
  end
  
  task :nodejs_uninstall do
    sh "brew uninstall node"
  end

  task :npm_update do
      puts "Updating global npm modules..."
      sh "npm update -g"
  end
  
  task :coffee_install => [:npm_install] do
    if not File.exists? "/usr/local/bin/coffee"
      sh "npm install -g coffee-script"
    end
  end
  
  task :coffee_uninstall do
    sh "npm uninstall -g coffee-script"
  end
  
end

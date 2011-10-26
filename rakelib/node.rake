namespace :node do
  
  desc "install node.js and npm package manager"
  task :install => [:nodejs_install, :npm_install]
  
  desc "uninstall node.js and npm"
  task :uninstall => [:npm_uninstall, :nodejs_uninstall]
  
  task :nodejs_install => ['homebrew:brew_install'] do
    if not File.exists? "/usr/local/bin/node"
      sh "brew install node"
    end
  end
  
  task :nodejs_uninstall do
    sh "brew uninstall node"
  end

  task :npm_install do
    if not File.exists? "/usr/local/bin/npm"
      sh "curl http://npmjs.org/install.sh | sh"
    end
  end
  
  task :npm_uninstall do
    puts "Uninstalling npm..."
    sh "npm uninstall npm -g"
  end
  
end

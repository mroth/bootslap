namespace :git do
  
  task :config do
    sh "git config --global user.name 'Matthew Rothenberg'"
    sh "git config --global user.email 'mrothenberg@gmail.com'"
    sh "git config --global color.ui true"
  end
  
  task :config_github do
    sh "git config --global github.user mroth" #no harm in setting this repeatedly
    token = `git config --global github.token`
    if (token.chomp.size < 10) #assume something is funked
      #TODO: prompt for token
    end
  end
  
  desc "ensure homebrew version of git is installed"
  task :install_brewgit => ["homebrew:brew_install"] do
    if not File.exists? "/usr/local/bin/git" #mac devtools version lives at /usr/bin/git
      sh "brew install git"
    end
  end
  
end
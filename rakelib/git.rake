namespace :git do
  
  task :install => [:install_brewgit, :config, :config_github, :install_scmbreeze]
  
  desc "configures git variables"
  task :config do
    sh "git config --global user.name 'Matthew Rothenberg'"
    sh "git config --global user.email 'mrothenberg@gmail.com'"
    sh "git config --global color.ui true"
    sh "git config --global merge.tool opendiff"
    sh "git config --global core.excludesfile ~/.gitignore"
  end
  
  desc "configures github username and API token. (interactive)"
  task :config_github do
    sh "git config --global github.user mroth" #no harm in setting this repeatedly
    token = `git config --global github.token`
    if (token.chomp.size < 10) #assume something is funked
      print "You need your github API token.  Open web browser to get it? [Y/n] "
      input = STDIN.gets.strip
      if not input =~ /[Nn]/
        sh "open https://github.com/account/admin"
      end
      print "When you have your API key, enter it here:  "
      input = STDIN.gets.strip
      token = input.chomp
      if token.size > 10
        puts "Setting global github.token to #{token}"
        sh "git config --global github.token #{token}"
      else
        puts "That doesn't look like a github api token!"
        abort
      end
    end
  end
  
  desc "ensure homebrew version of git is installed"
  task :install_brewgit => ["homebrew:brew_install"] do
    if not File.exists? "/usr/local/bin/git" #mac devtools version lives at /usr/bin/git
      sh "brew install git"
    end
  end
  
  desc "install scm_breeze awesomeness for CLI"
  task :install_scmbreeze do
    subdir_clone( $home, '.scm_breeze', 'git://github.com/ndbroadbent/scm_breeze.git')
  end
  
end
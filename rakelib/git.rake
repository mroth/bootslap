namespace :git do
  
  task :install => [:install_brewgit, :config, :install_scmbreeze]
  
  desc "configures git variables"
  task :config do
    sh "git config --global user.name 'Matthew Rothenberg'"
    sh "git config --global user.email 'mrothenberg@gmail.com'"
    sh "git config --global github.user mroth" 
    sh "git config --global color.ui true"
    sh "git config --global merge.tool opendiff"
    sh "git config --global core.excludesfile ~/.gitignore"
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

  task :update_scmbreeze do
      sh "bash -ci 'update_scm_breeze'"
  end
  
end

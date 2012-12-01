namespace :git do
  
  task :install => [:install_brewgit, :install_scmbreeze]
  
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

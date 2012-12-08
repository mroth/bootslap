namespace :osx do

  desc "fix stuff broken after a 10.7 -> 10.8 upgrade"
  task :fix_mountain_lion  => [:install_xquartz] do
    puts "*** Have you installed Xcode 4.4 and updated the Command Line Tools? ***"
    puts "If not, hit Ctrl-C to abort, otherwise, enter to continue..."
    input = STDIN.gets.strip

    puts "Ok, fixing the fact that OSX updates fuck up everything..."
    verbose true

    #ugh we need XQuartz too?!

    #fix imagemagick library linking
    sh "brew uninstall imagemagick"
    sh "brew install --fresh imagemagick"

    #fix python, need to reinstall 
    sh "sudo easy_install pip"
    sh "sudo pip install virtualenv"
    sh "sudo pip install virtualenvwrapper"

    verbose false
  end

  desc "install xquartz (required for X11/libs on OSX 10.8)"
  task :install_xquartz do
    #TODO: WRITE ME
  end

end
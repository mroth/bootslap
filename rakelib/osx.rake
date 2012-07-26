namespace :osx do

  task :fix_mountain_lion do
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

end
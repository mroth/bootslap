namespace :sublime do
  
  task :install => [:packages_install]

  subl_packages_dir = "#{$home}/Library/Application Support/Sublime Text 2/Packages/"
    
  task :create_dirs do
    for dir in [subl_packages_dir] do
      if not File.directory? dir then FileUtils.mkdir_p dir end
    end
  end

  task :packages_install => [:create_dirs] do
    # subdir_clone( subl_packages_dir, 'sublimelint', 'git://github.com/lunixbochs/sublimelint.git' ) #wrong one
    # subdir_clone( tm_bundles_dir, 'CoffeeScript.tmbundle', 'git://github.com/jashkenas/coffee-script-tmbundle')
    # subdir_clone( tm_bundles_dir, 'JavaScript jQuery.tmbundle', 'git://github.com/kswedberg/jquery-tmbundle.git')
    
    # sh "osascript -e 'tell app \"TextMate\" to reload bundles'"
  end

  desc "Install the subl binary for CLI"
  task :cli_install do
      $cli_binary = "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
      if File.exists? $cli_binary
        FileUtils.ln_s $cli_binary, "/usr/local/bin/subl"
      end
  end

end

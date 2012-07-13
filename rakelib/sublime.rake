namespace :sublime do
  
  task :install => [:packages_install, :dropboxify_sublimetext_prefs, :cli_install]

  subl_packages_dir = "#{$home}/Library/Application Support/Sublime Text 2/Packages/"
  subl_user_packages_dir = File.join( subl_packages_dir, "User" )
  subl_user_packages_dropbox = "#{$home}/Dropbox/.config/SublimeText/"
    
  task :create_dirs do
    for dir in [subl_packages_dir, subl_user_packages_dropbox] do
      if not File.directory? dir then FileUtils.mkdir_p dir end
    end
  end

  desc "Link ST2 User Prefs to Dropbox"
  task :dropboxify_sublimetext_prefs => [:create_dirs] do
    if not File.symlink? subl_user_packages_dir
      FileUtils.mv subl_user_packages_dir, "#{subl_user_packages_dir}.old"
      FileUtils.ln_s subl_user_packages_dropbox, subl_user_packages_dir
    end
  end

  desc "Install Package Control for SublimeText2"
  task :packages_install => [:create_dirs] do
    #install package control, then the user prefs will handle the rest
    subdir_clone( subl_packages_dir, 'Package Control', 'git://github.com/wbond/sublime_package_control.git' )
  end

  desc "Install the subl binary for CLI"
  task :cli_install do
      $cli_binary = "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
      $cli_target = "/usr/local/bin/subl"
      if ( File.exists?($cli_binary) && !File.exists?($cli_target) )
        FileUtils.ln_s $cli_binary, $cli_target
      end
  end

end

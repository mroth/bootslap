namespace :textmate do
  
  task :install => [:bundles_install, :themes_install, :webpreview_themes_install]

  tm_bundles_dir = "#{$home}/Library/Application\ Support/TextMate/Bundles"
  tm_themes_dir = "#{$home}/Library/Application\ Support/TextMate/Themes"
  tm_webpreview_dir = "#{$home}/Library/Application\ Support/TextMate/Themes/WebPreview"
  tm_plugins_dir = "#{$home}/Library/Application\ Support/TextMate/Plugins/"
    
  task :create_dirs do
    for dir in [tm_bundles_dir, tm_themes_dir, tm_webpreview_dir, tm_plugins_dir] do
      if not File.directory? dir then FileUtils.mkdir_p dir end
    end
  end
  
  task :plugins_install => [:create_dirs] do
    subdir_clone( $installers, 'projectplus', 'git://github.com/gknops/projectplus.git' )
    if not File.exists? "#{$installers}/projectplus/build/Release/ProjectPlus.tmplugin"
      sh( "cd #{$installers}/projectplus; xcodebuild")
    end
    if not File.exists? "#{tm_plugins_dir}/ProjectPlus.tmplugin"
      FileUtils.cp_r("#{$installers}/projectplus/build/Release/ProjectPlus.tmplugin", "#{tm_plugins_dir}/ProjectPlus.tmplugin")
    end
  end
  
  task :bundles_install => [:create_dirs] do
    subdir_clone( tm_bundles_dir, 'less.tmbundle', 'git://github.com/appden/less.tmbundle.git' )
    subdir_clone( tm_bundles_dir, 'CoffeeScript.tmbundle', 'git://github.com/jashkenas/coffee-script-tmbundle')
    subdir_clone( tm_bundles_dir, 'JavaScript jQuery.tmbundle', 'git://github.com/kswedberg/jquery-tmbundle.git')
    
    sh "osascript -e 'tell app \"TextMate\" to reload bundles'"
  end
  
  task :themes_install => [:create_dirs, "solarized:textmate_install"] do
    #TODO: any other themes?
  end
  
  task :webpreview_themes_install => [:create_dirs] do        
    subdir_clone( tm_webpreview_dir, 'github', 'git://github.com/kneath/github_textmate_preview.git')
  end
  
end

namespace :solarized do
  
  desc "install solarized color theme for [vim,textmate,TODO:iterm2]"
  task :install => [:vim_install, :textmate_install]
  
  solarized_dir = "#{$installers}/solarized"
  
  task :download do
    #get most recent version of files
    # if not File.directory? solarized_dir
    #   FileUtils.mkdir_p solarized_dir
    #   sh "git clone git://github.com/altercation/solarized.git #{solarized_dir}"
    # end
    subdir_clone( $installers, 'solarized', 'git://github.com/altercation/solarized.git' )
  end

  desc "install solarized color theme for textmate"
  task :textmate_install => [:download, "textmate:create_dirs"] do
    tm_themes_dir = "#{$home}/Library/Application\ Support/TextMate/Themes"
    FileUtils.cp( "#{solarized_dir}/textmate-colors-solarized/Solarized (Dark).tmTheme", tm_themes_dir )
    FileUtils.cp( "#{solarized_dir}/textmate-colors-solarized/Solarized (Light).tmTheme", tm_themes_dir )
  end

  desc "install solarized color theme for vim"
  task :vim_install => [:download] do
    #install for vim
    sh "mkdir -p ~/.vim/colors"
    sh "cp #{solarized_dir}/vim-colors-solarized/colors/solarized.vim ~/.vim/colors"
  end

end
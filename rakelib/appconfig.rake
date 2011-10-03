namespace :textmate do
  
  task :install => [:bundles_install, :themes_install, :webpreview_themes_install]

  tm_bundles_dir = "#{$home}/Library/Application\ Support/TextMate/Bundles"
  tm_themes_dir = "#{$home}/Library/Application\ Support/TextMate/Themes"
  tm_webpreview_dir = "#{$home}/Library/Application\ Support/TextMate/Themes/WebPreview"
    
  task :create_dirs do
    for dir in [tm_bundles_dir, tm_themes_dir, tm_webpreview_dir] do
      if not File.directory? dir then FileUtils.mkdir_p dir end
    end
  end
  
  task :bundles_install => [:create_dirs] do
    if not File.directory? "#{tm_bundles_dir}/less.tmbundle"
      sh "git clone git://github.com/appden/less.tmbundle.git '#{tm_bundles_dir}/less.tmbundle'"
    end
    
    sh "osascript -e 'tell app \"TextMate\" to reload bundles'"
  end
  
  task :themes_install => [:create_dirs, "solarized:textmate_install"] do
    #TODO: any other themes?
  end
  
  task :webpreview_themes_install => [:create_dirs] do        
    #install github textmate preview for markdown https://github.com/kneath/github_textmate_preview
    if not File.directory? "#{tm_webpreview_dir}/github"
      sh "git clone git://github.com/kneath/github_textmate_preview.git '#{tm_webpreview_dir}/github'"
    end
  end
  
end

namespace :solarized do
  
  desc "install solarized color theme for [vim,textmate,TODO:iterm2]"
  task :install => [:vim_install, :textmate_install]
  
  solarized_dir = "#{$installers}/solarized"
  
  task :download do
    #get most recent version of files
    if not File.directory? solarized_dir
      FileUtils.mkdir_p solarized_dir
      sh "git clone git://github.com/altercation/solarized.git #{solarized_dir}"
    end
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
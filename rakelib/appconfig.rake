namespace :solarized do
  
  desc "install solarized color theme for [vim,textmate,TODO:iterm2]"
  task :install => [:vim_install, :picker_install]
  
  solarized_dir = "#{$installers}/solarized"
  
  task :download do
    subdir_clone( $installers, 'solarized', 'git://github.com/altercation/solarized.git' )
  end

  desc "install solarized color theme for vim"
  task :vim_install => [:download] do
    #install for vim
    sh "mkdir -p ~/.vim/colors"
    sh "cp #{solarized_dir}/vim-colors-solarized/colors/solarized.vim ~/.vim/colors"
  end
  
  task :picker_install => [:download] do
    if not File.exists? "#{$home}/Library/Colors/solarized.clr"
      FileUtils.cp "#{solarized_dir}/apple-colorpalette-solarized/solarized.clr", "#{$home}/Library/Colors/solarized.clr"
    end
  end
  
end
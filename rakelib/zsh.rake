namespace :zsh do

    task :install => [:syntax_highlighting_install]
    task :update => [:ohmyzsh_update, :ohmyzsh_update_custom_plugins]

    #deprecated.. now handled via cookbooks
    task :ohmyzsh_install do
      subdir_clone( $home, '.oh-my-zsh', 'git://github.com/robbyrussell/oh-my-zsh.git')
    end

    desc "upgrade ohmyzsh to latest version"
    task :ohmyzsh_update => [:ohmyzsh_install] do
      sh "zsh -ci 'upgrade_oh_my_zsh'" 
      #basically a function that sets env vars and does a git pull but lets wrap it anyhow in case it changes in future
    end

    desc "update all custom plugins for ohmyzsh"
    task :ohmyzsh_update_custom_plugins => [:ohmyzsh_install] do
      Dir.glob("#{$home}/.oh-my-zsh/custom/plugins/*").each do |plugin_path|
        Dir.chdir(plugin_path) do
          sh "git pull"
        end
      end
    end

    desc "install syntax highlighting custom plugin for ohmyzsh"
    task :syntax_highlighting_install => [:ohmyzsh_install] do
      subdir_clone( "#{$home}/.oh-my-zsh/custom/plugins", "zsh-syntax-highlighting", "git://github.com/zsh-users/zsh-syntax-highlighting.git")
    end

end


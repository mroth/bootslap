namespace :zsh do

    task :install => [:ohmyzsh_install]

    task :ohmyzsh_install => ['dotfiles:install'] do
        subdir_clone( $home, '.oh-my-zsh', 'git://github.com/robbyrussell/oh-my-zsh.git')
    end

end


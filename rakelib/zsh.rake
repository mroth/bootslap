namespace :zsh do

    task :install => [:ohmyzsh_install, :syntax_highlighting_install]

    task :ohmyzsh_install => ['dotfiles:install'] do
        subdir_clone( $home, '.oh-my-zsh', 'git://github.com/robbyrussell/oh-my-zsh.git')
    end

    task :syntax_highlighting_install => [:ohmyzsh_install] do
        subdir_clone( "#{$home}/.oh-my-zsh/custom/plugins", "zsh-syntax-highlighting", "git://github.com/zsh-users/zsh-syntax-highlighting.git")
    end

end


namespace :vim do

    task :install => [:plugins_install]

    task :janus_install do
        subdir_clone( $home, '.vim', 'git://github.com/carlhuda/janus.git')
        system "cd ~/.vim; rake"
    end

    task :pathogen_install do
        system "mkdir -p ~/.vim/autoload ~/.vim/bundle"
        system "curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
    end

    task :plugins_install => [:pathogen_install] do
        $pluginsdir = "#{$home}/.vim/bundle"
        subdir_clone( $pluginsdir, 'ctrlp.vim', 'https://github.com/kien/ctrlp.vim.git' )
        subdir_clone( $pluginsdir, 'rails.vim', 'git://github.com/tpope/vim-rails.git' )
        subdir_clone( $pluginsdir, 'rake.vim', 'git://github.com/tpope/vim-rake.git' )
        subdir_clone( $pluginsdir, 'fugitive.vim', 'git://github.com/tpope/vim-fugitive.git' )
        subdir_clone( $pluginsdir, 'bundler.vim', 'git://github.com/tpope/vim-bundler.git' )
        subdir_clone( $pluginsdir, 'autoclose.vim', 'https://github.com/vim-scripts/AutoClose.git' )
        subdir_clone( $pluginsdir, 'matchtag.vim', 'https://github.com/gregsexton/MatchTag.git')
        subdir_clone( $pluginsdir, 'surround.vim', 'git://github.com/tpope/vim-surround.git')
        subdir_clone( $pluginsdir, 'nerdtree.vim', 'https://github.com/scrooloose/nerdtree.git')
    end
end


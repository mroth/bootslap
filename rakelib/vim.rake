namespace :vim do

    task :install => [:janus_install]

    task :janus_install do
        target = "#{$home}/.vim"
        dotgit = "#{target}/.git"
        janusrepo = 'https://github.com/carlhuda/janus.git'

        if (File.exists?(target) && File.exists?(dotgit) )
            remote_url = `cd #{target}; git remote -v | grep fetch | awk '{print $2}'`.chomp
            if remote_url == janusrepo
                puts "*** bootstrapper: .vim is already part of janus, updating"
                Rake::Task['vim:janus_update'].execute   
            end
        else
            system "curl -Lo- http://bit.ly/janus-bootstrap | bash"
        end
        
    end
    
    task :janus_update do
        FileUtils.cd "#{$home}/.vim"
        system "rake"
    end

    # No longer used with new version of janus with autoinstaller
    # TODO: clean me up
    # task :old_janus_install do
    #         target = "#{$home}/.vim"
    #         dotgit = "#{target}/.git"
    #         janusrepo = 'git://github.com/carlhuda/janus.git'
    # 
    #         if (File.exists?(target) && File.exists?(dotgit) )
    #             remote_url = `cd #{target}; git remote -v | grep fetch | awk '{print $2}'`.chomp
    #             if remote_url == janusrepo
    #                 puts "*** bootstrapper: .vim is already part of janus"
    #             else
    #                 # puts remote_url + " not proper"
    #                 FileUtils.move target, (target + ".old")
    #             end
    #         elsif File.exists?(target)
    #             FileUtils.move target, (target + ".old")
    #         end
    #         
    #         subdir_clone( $home, '.vim', janusrepo)
    # 
    #         #check if .vimrc and .gvimrc are symlinked to proper place for janus
    #         #janus installer is going to assume these DONT EXIST at all, so do the right thing
    #         #...before we run janus rake installer
    #         %w[ vimrc gvimrc ].each do |filename|
    #             dotfile = File.expand_path("~/.#{filename}")
    #             if ( File.exists?(dotfile) || File.symlink?(dotfile) )
    #                 if not File.symlink? dotfile
    #                     puts "*** bootstrapper: existing #{dotfile}, renaming"
    #                     File.rename dotfile, (dotfile + ".old")
    #                 elsif File.readlink(dotfile) != "#{$home}/.vim/janus/vim/#{filename}"
    #                     puts "*** bootstrapper: #{dotfile} is a symlink already but to the wrong place, renaming"
    #                     File.rename dotfile, (dotfile + ".old")
    #                 else
    #                     puts "*** bootstrapper: #{dotfile} seem to be already symlinked to proper janus place"
    #                 end
    #             end
    #         end
    # 
    #         system "cd ~/.vim; rake"
    #     end
    # 
    # task :pathogen_install do
    #     system "mkdir -p ~/.vim/autoload ~/.vim/bundle"
    #     system "curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim"
    # end


    # no longer used thanks to janus
    # but keep me around as a pattern in case we want to do this later for additional plugins
    # TODO: check if there are any of these not automatically installed by janus I liked
    
    # task :plugins_install => [:pathogen_install] do
    #     $pluginsdir = "#{$home}/.vim/bundle"
    #     subdir_clone( $pluginsdir, 'ctrlp.vim', 'https://github.com/kien/ctrlp.vim.git' )
    #     subdir_clone( $pluginsdir, 'rails.vim', 'git://github.com/tpope/vim-rails.git' )
    #     subdir_clone( $pluginsdir, 'rake.vim', 'git://github.com/tpope/vim-rake.git' )
    #     subdir_clone( $pluginsdir, 'fugitive.vim', 'git://github.com/tpope/vim-fugitive.git' )
    #     subdir_clone( $pluginsdir, 'bundler.vim', 'git://github.com/tpope/vim-bundler.git' )
    #     subdir_clone( $pluginsdir, 'autoclose.vim', 'https://github.com/vim-scripts/AutoClose.git' )
    #     subdir_clone( $pluginsdir, 'matchtag.vim', 'https://github.com/gregsexton/MatchTag.git')
    #     subdir_clone( $pluginsdir, 'surround.vim', 'git://github.com/tpope/vim-surround.git')
    #     subdir_clone( $pluginsdir, 'nerdtree.vim', 'https://github.com/scrooloose/nerdtree.git')
    # end

end


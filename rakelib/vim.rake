namespace :vim do

    task :install => [:macvim_install, :janus_install]

    task :macvim_install do
        sh "brew install macvim" unless File.exists?("/usr/local/bin/mvim")
    end 

    task :janus_install do
        target = "#{$home}/.vim"
        dotgit = "#{target}/.git"
        janusrepo = 'https://github.com/carlhuda/janus.git'

        if (File.exists?(target) && File.exists?(dotgit) )
            remote_url = `cd #{target}; git remote -v | grep fetch | awk '{print $2}'`.chomp
            if remote_url == janusrepo
                puts "*** bootstrapper: .vim is already part of janus" 
            end
        else
            system "curl -Lo- http://bit.ly/janus-bootstrap | bash"
        end
    end
    
    task :janus_update do
        FileUtils.cd "#{$home}/.vim"
        system "rake"
    end

end


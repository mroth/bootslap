#########################################
# Main dotfiles installer
#########################################
namespace :dotfiles do
  desc "install dotfiles"
  task :install do

    FileList["#{$home}/.dothome/dotfiles/*"].each do |file|
    
      base = File.basename(file)
      target = File.join($home, ".#{base}")
      src = ".dothome/dotfiles/#{base}"
    
      next if %w[README.md Rakefile].include? base
      next if not File.file? file
    
      if File.symlink? target and (File.readlink(target) == src)
        puts "*** ~/.#{base} already symlinked properly" #lets not spam on this now since this will be a prereq for a lot of things
      elsif File.symlink? target
        #symlinked but to the wrong place (e.g. I moved directory structure for bootstrapper)
        #just resymlink to repair
        puts "+++ symlink moved, re-linking ~/.#{base}"
        FileUtils.ln_s(src, target, :force => true)
      elsif File.exist? target
        puts "!!! backing up existing ~/.#{base} to ~/.#{base}.old "
        FileUtils.mv(target,"#{target}.old")
        puts "+++ linking ~/.#{base}"
        File.symlink(src, target)
      else
        puts "+++ linking ~/.#{base}"
        File.symlink(src, target)
      end
    end
  end
  
  desc "uninstall dotfiles, restoring whatever existed before"
  task :uninstall do
    abort "...not implemented yet, sorry!"
    #TODO: remove symlinks
    #TODO: restore .old files if they exist
  end
end

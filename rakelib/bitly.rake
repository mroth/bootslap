#
# install programs/ I need specificly for my current job.
# segmenting this as it's stuff that (probably) won't apply elsewhere.
# TODO: set up a git.rake that configures git to access github
#
namespace :bitly do
  $bitly_src = "#{$home}/src/bitly"
  
  desc "Create a virtualenv that has the python stuff we need to run a prototype server"
  task :proto_vm do
  end

  desc "Set up a full development VM mirroring our production environment."
  task :prod_vm do
  end

  desc "Create local directory to hold source repos"
  task :src_dir do
    if not File.directory? "#{$bitly_src}"
      FileUtils.mkdir_p "#{$bitly_src}"
    end
  end

  desc "Check out the prototypes repo"
  task :proto_src => [:src_dir] do
    if not File.directory? "#{$bitly_src}/prototypes"
      sh "git clone git@github.com:bitly/prototypes.git #{$bitly_src}/prototypes"
    end
  end

  desc "Check out the production repo"
  task :prod_src => [:src_dir] do
    if not File.directory? "#{$bitly_src}/bitly"
      sh "git clone git@github.com:bitly/bitly.git #{$bitly_src}/bitly"
    end
  end

  desc "Installs everything"
  task :install => [:proto_src, :prod_src, :proto_vm, :prod_vm]

  desc "Uninstall everything (WARNING: BE SURE YOU DONT HAVE UNCOMMITTED CHANGES!)"
  task :uninstall do
    #TODO: blow it all away
  end

end

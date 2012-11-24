namespace :cookbooks do 

  desc "Setup cookbooks"
  task :setup => [:clobber, :setup_dependencies] do
    subdir_clone "cookbooks", "pivotal_workstation", "https://github.com/pivotal/pivotal_workstation"
  end

  desc "Setup cookbooks in development mode"
  task :setup_dev => [:clobber, :setup_dependencies] do
    subdir_clone "cookbooks", "pivotal_workstation", "https://github.com/mroth/pivotal_workstation"
  end

  task :setup_dependencies do
    subdir_clone "cookbooks", "dmg", "https://github.com/opscode-cookbooks/dmg"
  end

  desc "Clean out the cookbooks directory entirely"
  task :clobber do
    FileUtils.rm_r Dir.glob("cookbooks/*"), :secure => true
  end

  desc "Update all cookbookes from remote"
  task :update do
    Dir.glob("cookbooks/*").each do |cookbook_path|
      Dir.chdir(cookbook_path) do
        sh "git pull"
      end
    end
  end

end

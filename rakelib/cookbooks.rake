namespace :cookbooks do 

  desc "Converge cookbook recipes via soloistrc"
  task :converge => [:ready] do
    verbose true
    sh "soloist"
    verbose false
  end

  desc "Setup cookbooks"
  task :setup => [:clobber, :setup_dependencies] do
    subdir_clone "cookbooks", "pivotal_workstation", "https://github.com/pivotal/pivotal_workstation"
  end

  desc "Setup cookbooks in development mode"
  task :setup_dev => [:clobber, :setup_dependencies] do
    subdir_clone "cookbooks", "pivotal_workstation", "https://github.com/mroth/pivotal_workstation"
    Dir.chdir("cookbooks/pivotal_workstation") do
      sh "git remote add upstream https://github.com/pivotal/pivotal_workstation"
      sh "git fetch upstream"
      sh "git checkout --track -b upstream upstream/master"
      sh "git checkout master"
    end
  end

  task :setup_dependencies do
    subdir_clone "cookbooks", "dmg", "https://github.com/opscode-cookbooks/dmg"
  end

  # use this to ensure cookbooks are there, but dont clobber since i am frequently using
  # a dev clone instead
  task :ready do
    Rake::Task['cookbooks:setup'].invoke unless File.directory? "cookbooks/pivotal_workstation"
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

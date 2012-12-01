namespace :babushka do
  
  task :install do
    if not File.exists? "/usr/local/bin/babushka"
      sh "bash -c '`curl babushka.me/up`'"
    end
  end
  
end
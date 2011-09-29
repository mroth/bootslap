task :python do
  if not File.exists? "/usr/local/bin/pip"
    sh "sudo easy_install pip"
  end
  if not File.exists? "/usr/local/bin/virtualenv"
    sh "sudo pip install virtualenv"
  end
  if not File.exists? "/usr/local/bin/virtualenvwrapper.sh"
    sh "sudo pip install virtualenvwrapper"
  end
  if not File.directory? "#{$home}/.virtualenvs"
    sh "mkdir -p #{$home}/.virtualenvs"
  end
end

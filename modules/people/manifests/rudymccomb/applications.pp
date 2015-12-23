class people::rudymccomb::applications {
  include packer
  #include chrome
  #include chrome::canary
  #include virtualbox
  #include dash
  #include evernote
  #include googledrive
  #include cyberduck
  #include firefox
  #include skype
  #include vlc
  #include docker
  #include vagrant

  #package 'docker'{
  #  ensure => absent
  #}

  #include iterm2::stable
  #include iterm2::colors::solarized_dark

}

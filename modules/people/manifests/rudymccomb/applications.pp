class people::rudymccomb::applications {
  include packer

  package { 'puppet-lint':
    ensure   => '1.1.0',
    provider => 'gem',
  }
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

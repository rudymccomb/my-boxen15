class people::rudymccomb {

  # install packages below
  notify { 'class people::rudymccomb declared': }

  #include people::rudymccomb::applications
  #include people::rudymccomb::dotfiles
  #include people::rudymccomb::gitconfig
  #include people::rudymccomb::preferences

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  #osx_chsh { $::luser:
  #  shell   => '/opt/boxen/homebrew/bin/zsh',
  #  require => Package['zsh'],
  #}

  #file_line { 'add zsh to /etc/shells':
  #  path    => '/etc/shells',
  #  line    => "${boxen::config::homebrewdir}/bin/zsh",
  #  require => Package['zsh'],
  #}



  package { 'puppet-lint':
    ensure   => '1.1.0',
    provider => 'gem',
  }

  include packer

  #create home folder directory
  file { '/Users/shared/test':
    ensure     => 'directory',
  }

  # Just verify file permissions.
  file { "/Users/shared/test/RestrictedFile.txt":
    mode => 755,
    ensure => present,
    content => "Nobody read the contents of this file.",
  }

  ####atom editor
  #include atom

  # install atom packages
  #atom::package { 'autocomplete-paths': }
  #atom::package { 'language-puppet': }


  # install atom themes
  #atom::theme { 'monokai': }

  ####OSX settings ###########



  #### Printers #######
  #printer { "HP LaserJet 4250":
  #ensure      => present,
  #description => "HP LaserJet 4250",
  #enabled     => true,
  #accept      => true,
  #location    => "LA 22nd Floor",
  #ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP C300SR",
  #uri         => "lpd://10.100.0.50 ",
#}

  ##################################
  ## Facter, Puppet, and Envpuppet##
  ##################################

  repository { "${::boxen_srcdir}/puppet":
    source => 'puppetlabs/puppet',
  }

  repository { "${::boxen_srcdir}/facter":
    source => 'puppetlabs/facter',
  }

  #file { '/bin/envpuppet':
  #  ensure  => link,
  #  mode    => '0755',
  #  target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
  #  require => Repository["${::boxen_srcdir}/puppet"],
  #}
}

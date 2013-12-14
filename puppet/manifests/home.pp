node home-desktop {
  class { 'apt': }
  class { 'my::essentials': }
  class { 'my::editors': }
  class { 'my::terminal': }
}

node calcium inherits home-desktop {}

# I will always want all this stuff.
class my::essentials {
  package { [
    'screen',
    'subversion',
    'imagemagick',
    'python3',
    'ruby1.9.1',
    'toilet' # so useful
  ]:}

  # Nice new git
  apt::ppa { 'ppa:git-core/ppa': }
  package { 'git' : 
    ensure  => latest,
    require => Apt::Ppa['ppa:git-core/ppa']
  }
}

class my::editors {
  # Who am I kidding, I hate vim
  package { ['vim', 'nano']: 
    ensure => installed 
  }
}


class my::terminal {
  # TODO auto setup with zprezto and stuff.
  package { 'zsh':
    ensure => installed
  }
}



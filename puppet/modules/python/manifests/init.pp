class python {
  package {'scl-utils':
    ensure =>  present,
    before => Package['centos-release-scl-rh'],
  }
  package {'centos-release-scl-rh':
    ensure =>  present,
    before => Package['python27'],
  }
  package { 'python27':
    ensure =>  present,
    before => Exec['enable_python27'],
  }
  exec {'enable_python27':
    command => 'scl enable python27 bash',
    provider => shell,
  }
}

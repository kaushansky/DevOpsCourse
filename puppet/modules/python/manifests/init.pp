class python{
  package { [ 'python', 'python-dev', 'python-pip']:
    ensure => present,
  }
}

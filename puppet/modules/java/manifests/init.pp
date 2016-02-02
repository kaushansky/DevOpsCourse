class java {
  package { 'java-1.7.0-openjdk':
    ensure => present,
  }
  package { 'java-1.8.0-openjdk':
    ensure => present,
  }
}

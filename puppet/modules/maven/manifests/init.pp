class maven {
  require java
  package { 'maven':
    ensure  => present,
  }
}

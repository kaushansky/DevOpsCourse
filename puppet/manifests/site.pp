node default {

}

node 'puppet.amat.com' {
  Class['myfiles'] -> Class['ntp']
  include myfiles
  include ntp
}
node 'build-node-01.amat.com' {
  Class['ntp'] -> Class['java'] -> Class['maven'] -> Class['git']
  include ntp
  include java
  include maven
  include git
}
node 'jenkins.amat.com' {
  Class['ntp'] -> Class['java'] -> Class['jenkins']
  include ntp
  include java
  include jenkins
}
node 'webserver.amat.com' {
  Class['ntp'] -> Class['apache'] -> Class['python']
  include ntp
  include apache
  include python
}


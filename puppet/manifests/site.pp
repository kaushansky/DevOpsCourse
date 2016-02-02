node default {

}

node "ak-control.ak-control.g10.internal.cloudapp.net" {
  Class['myfiles'] -> Class['ntp']
  include myfiles
  include ntp
}
node "build-node-01.build-node-01.g3.internal.cloudapp.net" {
  Class['ntp'] -> Class['java'] -> Class['maven'] -> Class['git']
  include ntp
  include java
  include maven
  include git
}
node "ak-jenkins.ak-jenkins.g6.internal.cloudapp.net" {
  Class['ntp'] -> Class['java'] -> Class['jenkins']
  include ntp
  include java
  include jenkins
}
node "ak-webserver.ak-webserver.g10.internal.cloudapp.net" {
  Class['ntp'] -> Class['python']
  include ntp
  include python
  class { 'epel': }->
          tomcat::instance{ 'default':
          package_name => 'tomcat',
        }->
        tomcat::service { 'default':
          use_jsvc     => false,
          use_init     => true,
          service_name => 'tomcat',
        }
  wget {'/etc/jenkins/getwar.py':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/webserver/getwar.py',
  }
}

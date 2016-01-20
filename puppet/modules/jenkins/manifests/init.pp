class jenkins {
	require java
	require ntp
	package { 'jenkins':
	  ensure  => present,
	  require => Yumrepo['jenkins'],
	}
	yumrepo { 'jenkins':
	  baseurl  => 'http://pkg.jenkins-ci.org/redhat',
	  descr    => 'Jenkins',
	  enabled  => 1,
	  gpgcheck => 1,
	  gpgkey   => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
	  require  => Wget['/etc/pki/rpm-gpg/jenkins-ci.org.key'],
	}
	wget { '/etc/pki/rpm-gpg/jenkins-ci.org.key':
	  ensure   => present,
	  url      => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
	}
	service { 'jenkins':
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          enable     => true,
	  subscribe  => Package['jenkins'],
      }
}

class jenkins {
	package { 'jenkins':
		ensure  => present,
		require => Yumrepo['jenkins'],
		subscribe => Package['java-1.7.0-openjdk'],
	}

	yumrepo { 'jenkins':
		baseurl  => 'http://pkg.jenkins-ci.org/redhat',
		descr    => 'Jenkins',
		enabled  => 1,
		gpgcheck => 1,
		gpgkey   => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key',
		require  => File['/etc/pki/rpm-gpg/jenkins-ci.org.key'],
	}
	  
	file { '/etc/pki/rpm-gpg/jenkins-ci.org.key':
		owner  => root,
		group  => root,
		mode   => 0600,
		source => 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
	}
	  service { 'jenkins':
        ensure     => running,
        hasstatus  => true,
        hasrestart => true,
        enable     => true,
		subscribe  => Package['jenkins'],
      }
    
    # install java
      package { 'java-1.7.0-openjdk':
        ensure => present,
      }
}

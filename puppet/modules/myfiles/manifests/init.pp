class myfiles {
  file {['/etc/puppet/modules', 
         '/etc/puppet/manifests',
		 '/etc/puppet/modules/ntp',
		 '/etc/puppet/modules/ntp/manifests',
		 '/etc/puppet/modules/apache',
		 '/etc/puppet/modules/apache/manifests',
		 '/etc/puppet/modules/git',
         '/etc/puppet/modules/git/manifests',
		 '/etc/puppet/modules/jenkins',
         '/etc/puppet/modules/jenkins/manifests',
		 '/etc/puppet/modules/maven',
         '/etc/puppet/modules/maven/manifests',
		 '/etc/puppet/modules/python',
         '/etc/puppet/modules/python/manifests',
         '/etc/puppet/modules/java',
         '/etc/puppet/modules/java/manifests']:
     ensure => 'directory',
	 before => [Wget['/etc/puppet/modules/python/manifests/init.pp'],Wget['/etc/puppet/modules/maven/manifests/init.pp'],Wget['/etc/puppet/modules/jenkins/manifests/init.pp'],Wget['/etc/puppet/modules/ntp/manifests/init.pp'],Wget['/etc/puppet/modules/apache/manifests/init.pp'],Wget['/etc/puppet/modules/git/manifests/init.pp']]
  }
      
  wget {'/etc/puppet/modules/ntp/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/ntp/manifests/init.pp',
  }
  wget {'/etc/puppet/modules/apache/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/apache/manifests/init.pp',
  }
  wget {'/etc/puppet/modules/git/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/git/manifests/init.pp',
  }
  wget {'/etc/puppet/modules/jenkins/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/jenkins/manifests/init.pp',
  }
  wget {'/etc/puppet/modules/maven/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/maven/manifests/init.pp',
  }
  wget {'/etc/puppet/modules/python/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/python/manifests/init.pp',
  }
  wget {'/etc/puppet/modules/java/manifests/init.pp':
    ensure   => present,
    url    => 'https://raw.githubusercontent.com/kaushansky/DevOpsCourse/master/puppet/modules/java/manifests/init.pp',
  }
}


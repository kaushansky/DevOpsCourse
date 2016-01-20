class git{
    require ntp
    package { 'git':
        ensure => present,
    }
}

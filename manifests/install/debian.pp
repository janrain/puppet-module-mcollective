
class mcollective::install::debian {
    package { "ruby":
        ensure => installed,
    }   
    package { "rubygems":
        ensure => installed,
    }
    package { "stomp": 
        provider => gem,
        require => Package["ruby", "rubygems"],
        #ensure => "1.1",
    }

    package { "mcollective":
        ensure => $mcollective_package_version ? {
            "" => present,
            default => $mcollective_package_version
        },
        require => Package["stomp"],
    }

}


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


    # package { "mcollective":
    # NOTE: This package comes from the puppet repository, which is  
    #       setup via puppetd::client.  This package gets declared 
    #	    in apps::mcollective (dependent on puppetd::client).
    #       Any Package["mcollective*"] requirements in this module
    #	    refers to  those declared in apps::mcollective + client -AG
}

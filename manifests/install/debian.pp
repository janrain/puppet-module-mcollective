
class mcollective::install::debian {

        $require = Class[apps::ruby]
        package { "stomp":
                provider => gem,
                ensure => "1.1.9",
                notify => Service["mcollective"],

        # package { "mcollective":
        # NOTE: This package comes from the puppet repository, which is
        #       setup via puppetd::client.  This package gets declared
        #       in apps::mcollective (dependent on puppetd::client).
        #       Any Package["mcollective*"] requirements in this module
        #       refers to  those declared in apps::mcollective + client -AG
}


class mcollective::install::debian {
        #require 'apps:stomp' which makes sure libstomp isn't installed.
        $require = Class['apps::ruby','apps:stomp']
        package { 'stomp':
                ensure   => '1.2.8',
                provider => gem,
                notify   => Service['mcollective'],
                }

        # package { "mcollective":
        # NOTE: This package comes from the puppet repository, which is
        #       setup via puppetd::client.  This package gets declared
        #       in apps::mcollective (dependent on puppetd::client).
        #       Any Package["mcollective*"] requirements in this module
        #       refers to  those declared in apps::mcollective + client -AG
}

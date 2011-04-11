# class mcollective::plugin::puppetd::commander 
class mcollective::plugin::puppetd::commander {
    mcollective::client_file { "puppetcommanderd": 
        source => "agent/puppetd/commander/puppetcommanderd",
        require => Class["apps::mcollective"],
    }
    file { "/etc/puppetcommander.cfg": 
        source => "puppet:///modules/mcollective/plugins/agent/puppetd/commander/puppetcommander.cfg",
        alias => "commander_cfg",
    }
    # keep init script happy, create symlink
    file { "/usr/sbin/puppetcommanderd":
        ensure => "/usr/local/bin/puppetcommanderd",
        require => Mcollective::Client_file["puppetcommanderd"],
        alias => "commander_link",
    }
    file { "/etc/init.d/puppetcommander":
        source => "puppet:///modules/mcollective/plugins/agent/puppetd/commander/puppetcommander.init",
        mode => 755,
        alias => "commander_init",
        require => [File["commander_link", "commander_cfg"],Mcollective::Client_file["puppetcommanderd"]],
    }
    service { "puppetcommander":
        ensure => "true",
        enable => "true",
        require => File["commander_init"],
        subscribe => File["commander_cfg"],
    }    
}


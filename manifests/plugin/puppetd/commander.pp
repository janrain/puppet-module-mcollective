
class mcollective::plugin::puppetd::commander {
    mcollective::client_file { "puppetcommanderd": source => "agent/puppetd/commander/puppetcommanderd" }
}


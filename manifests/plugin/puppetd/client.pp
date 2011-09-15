
class mcollective::plugin::puppetd::client {
    mcollective::client_file { "mc-puppetd": source => "puppet://modules/mcollective/plugins/agent/puppetd/mc-puppetd" }
}


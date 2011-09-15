
class mcollective::plugin::groupwho::client {
    mcollective::client_file { "mc-groupwho": source => "puppet://modules/mcollective/plugins/agent/groupwho/mc-groupwho" }
}


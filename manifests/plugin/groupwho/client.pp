
class mcollective::plugin::groupwho::client {
    mcollective::client_file { "mc-groupwho": source => "agent/groupwho/mc-groupwho" }
}


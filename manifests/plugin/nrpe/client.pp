

class mcollective::plugin::nrpe::client {
    include mcollective::plugin::nrpe::ddl 
    mcollective::client_file { "mc-nrpe": source => "puppet:///modules/mcollective/plugins/agent/nrpe/mc-nrpe" }
}


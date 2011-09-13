

class mcollective::plugin::nrpe {
    include mcollective::plugin::nrpe::ddl 
    mcollective::plugin_file { "agent/nrpe.rb": source => "puppet:///modules/mcollective/plugins/agent/nrpe/nrpe.rb" }
}

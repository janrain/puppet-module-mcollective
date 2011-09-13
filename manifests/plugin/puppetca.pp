

class mcollective::plugin::puppetca {
    include mcollective::plugin::puppetca::ddl 
    mcollective::plugin_file { "agent/puppetca.rb": source => "puppet:///modules/mcollective/plugins/agent/puppetca/puppetca.rb" }
}



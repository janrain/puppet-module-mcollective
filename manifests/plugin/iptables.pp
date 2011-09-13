

class mcollective::plugin::iptables {
    include mcollective::plugin::iptables::ddl 
    mcollective::plugin_file { "agent/iptables.rb": source => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/iptables.rb" }
}


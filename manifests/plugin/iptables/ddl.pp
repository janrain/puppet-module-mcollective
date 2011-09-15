
class mcollective::plugin::iptables::ddl {
    mcollective::ddl_file { "agent/iptables.ddl": source => "puppet://modules/mcollective/plugins/agent/iptables-junkfilter/iptables.ddl" }
}

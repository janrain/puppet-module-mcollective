
class mcollective::plugin::nrpe::ddl {
    mcollective::ddl_file { "agent/nrpe.ddl": source => "puppet:///modules/mcollective/plugins/agent/nrpe/nrpe.ddl" }
}

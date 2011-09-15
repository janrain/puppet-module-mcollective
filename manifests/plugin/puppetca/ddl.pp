
class mcollective::plugin::puppetca::ddl {
    mcollective::ddl_file { "agent/puppetca.ddl": source => "puppet://modules/mcollective/plugins/agent/puppetca/puppetca.ddl" }
}

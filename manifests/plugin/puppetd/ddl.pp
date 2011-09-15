
class mcollective::plugin::puppetd::ddl {
    mcollective::ddl_file { "agent/puppetd.ddl": source => "puppet://modules/mcollective/plugins/agent/puppetd/puppetd.ddl" }
}

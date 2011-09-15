
class mcollective::plugin::puppetd::ddl {
    mcollective::ddl_file { "agent/puppetd.ddl": source => "agent/puppetd/puppetd.ddl" }
}


class mcollective::plugin::package::ddl {
    mcollective::ddl_file { "agent/package.ddl": source => "puppet:///modules/mcollective/plugins/agent/package/package.ddl" }
}


class mcollective::plugin::service::ddl {
    mcollective::ddl_file { "agent/service.ddl": source => "puppet:///modules/mcollective/plugins/agent/service/service.ddl" }
}


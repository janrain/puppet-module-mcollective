
class mcollective::plugin::service::client {
    include mcollective::plugin::service::ddl 
    mcollective::client_file { "mc-service": source => "puppet://modules/mcollective/plugins/agent/service/mc-service" }
}


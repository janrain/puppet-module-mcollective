
class mcollective::plugin::service {
    include mcollective::plugin::service::ddl 
    mcollective::plugin_file { "agent/service.rb": source => "puppet://modules/mcollective/plugins/agent/service/puppet-service.rb" }
}


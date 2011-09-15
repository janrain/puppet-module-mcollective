
class mcollective::plugin::package::client {
    include mcollective::plugin::package::ddl 
    mcollective::client_file { "mc-package": source => "puppet:///modules/mcollective/plugins/agent/package/mc-package" }
}


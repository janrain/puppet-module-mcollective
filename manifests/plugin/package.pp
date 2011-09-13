

class mcollective::plugin::package {
    include mcollective::plugin::package::ddl 
    mcollective::plugin_file { "agent/package.rb": source => "puppet:///modules/mcollective/plugins/agent/package/puppet-package.rb" }
}


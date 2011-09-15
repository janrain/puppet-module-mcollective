
class mcollective::plugin::puppetd {
    include mcollective::plugin::puppetd::ddl
    mcollective::plugin_file { "agent/puppetd.rb": source => "puppet://modules/mcollective/plugins/agent/puppetd/puppetd.rb" }
}


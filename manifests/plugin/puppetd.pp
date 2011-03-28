
class mcollective::plugin::puppetd {
    include mcollective::plugin::puppetd::ddl
    mcollective::plugin_file { "agent/puppetd.rb": source => "agent/puppetd/puppetd.rb" }
}


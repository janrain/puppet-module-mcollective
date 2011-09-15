
class mcollective::plugin::groupwho {
    mcollective::plugin_file { "agent/groupwho.rb": source => "puppet://modules/mcollective/plugins/agent/groupwho/groupwho.rb" }
}


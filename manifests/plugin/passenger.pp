
class mcollective::plugin::passenger {
    mcollective::plugin_file { "agent/passenger.rb": source => "puppet:///modules/mcollective/plugins/agent/passenger/passenger.rb" }
}


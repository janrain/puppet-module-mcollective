
class mcollective::plugin::passenger {
    mcollective::plugin_file { "agent/passenger.rb": source => "agent/passenger/passenger.rb" }
}


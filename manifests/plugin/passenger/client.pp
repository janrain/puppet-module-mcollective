
class mcollective::plugin::passenger::client {
    mcollective::client_file { "mc-passenger": source => "agent/passenger/mc-passenger" }
}


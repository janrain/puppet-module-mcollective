
class mcollective::plugin::passenger::client {
    mcollective::client_file { "mc-passenger": source => "puppet:///modules/mcollective/plugins/agent/passenger/mc-passenger" }
}


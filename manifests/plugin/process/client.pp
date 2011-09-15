
class mcollective::plugin::process::client {
    mcollective::client_file { "mc-pgrep": source => "puppet://modules/mcollective/plugins/agent/process/mc-pgrep" }
}


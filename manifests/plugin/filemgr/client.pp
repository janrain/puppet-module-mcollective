
class mcollective::plugin::filemgr::client {
    mcollective::client_file { "mc-filemgr": source => "puppet:///modules/mcollective/plugins/agent/filemgr/mc-filemgr" }
}



class mcollective::plugin::filemgr {
    mcollective::plugin_file { "agent/filemgr.rb": source => "puppet://modules/mcollective/plugins/agent/filemgr/filemgr.rb" }
}



# this agent is used for updating puppet release tags in puppet manifests
# and should only be declared on the puppetmaster.
class mcollective::plugin::lcars {
    mcollective::plugin_file { "agent/lcars.rb": source => "agent/lcars/lcars.rb" }
}


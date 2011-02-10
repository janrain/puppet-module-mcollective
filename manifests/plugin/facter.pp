
class mcollective::plugin::facter {
    mcollective::plugin_file { "facts/facter_facts.rb": source => "facts/facter/facter_facts.rb" }
}


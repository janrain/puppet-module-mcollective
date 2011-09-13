
class mcollective::plugin::facter {
    mcollective::plugin_file { "facts/facter_facts.rb": source => "puppet:///modules/mcollective/plugins/facts/facter/facter_facts.rb" }
    mcollective::plugin_file { "facts/facter.rb": source => "puppet:///modules/mcollective/plugins/facts/facter/facter_facts.rb" }
}


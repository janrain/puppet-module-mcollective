
class mcollective::client::actual {
    #NOTE: We handle installing these from the apps::mcollective classes instead,
    #      to better ensure package gets installed first
    #include mcollective::client::install
    include mcollective::client::plugins
    include mcollective::client::config
}


module MCollective
    module Agent
        class Lcars<RPC::Agent
            def startup_hook
                meta[:license] = "GPL"
                meta[:author] = "Adam Gandelman"
                meta[:version] = "1"

                @timeout = 20

            end

            def updatetags_action
                updatetags
            end
            def help
                <<-EOH
                Update analytics' lcars git tags
                ========================
    
                Agent to update the puppet masters node configuration
                for specific analytics node type + environment. Use
                it to set the git tags that the lcars repository's HEAD
                points to.

                ACTIONS:
                    updatetags - Set the tag in the node entry for given node/type

                INPUT:
                    :tag        - The specific git tag to pull.  Make sure this exists 
                                  upstream first.
                    :node_type  - Node type to update: frontend OR worker
                    :env        - Update nodes in specific rails env: production, staging, testing, etc.
                                  (corresponds to class definition, ie janrain::analytics::worker::[ENV])

                OUTPUT:
                    :output     A string showing some human parsable status
                    :rc         Return code: 0 = success, failure otherwise
                EOH
            end

            private
            def updatetags
                reply[:debug] = ""
                file = File.open('/tmp/test', 'w')
                file.puts "Test"
                node_file="/etc/puppet/manifests/analytics-nodes/"
                case request[:env]
                    when 'production'
                        node_file += "production.pp"
                    when 'staging'
                        node_file += "staging.pp"
                    else
                        reply[:output] = "Invalid environment: #{request[:env]}"
                        reply[:rc] = 1 
                        reply.fail "Invalid environment"
                end
                case request[:node_type]
                    when 'worker'
                        domain = request[:env] == "production" ? "engage-cloud.com" : "rpxstaging.com"
                        node_name="ani-worker.#{domain}"
                    when 'frontend'
                        domain = request[:env] == "production" ? "janrain.com" : "rpxstaging.com"
                        node_name="analytics.#{domain}"
                    else
                        reply[:output] = "Invalid node type: #{request[:node_type]}"
                        reply[:rc] = 1
                        reply.fail "Invalid node type"
                end
                reply[:node]="node: #{node_name}"
                reply[:output]="HI"
                if !File.exists?(node_file)
                    reply[:output] = "Could not locate node file @ #{node_file}"
                    reply[:rc] = 1
                    reply.fail "Couldn't find node file #{node_file}"
                end

                output=""
                node_entry=""
                reply[:debug] += "Opening file @ #{node_file}\n"

                matched = true
                File.open(node_file, "r") do |file|
                while line = file.gets
                    if line.split[0] == '#' && line.split[1] == 'last_updated'
                        output << "# last_updated via MCollective - #{Time.now}\n"
                    elsif   line.split[0] == "node" && line.split[1] == "\"#{node_name}\""
                        node_entry += line
                        line=file.gets
                        until line[0,1] == "}" || line.nil?
                            if line.split[0] == 'tag'
                                node_entry += "\t\ttag => '#{request[:tag]}',\n"
                                matched = true
                            else
                                node_entry += line 
                            end
                            line = file.gets
                        end
                        puts node_entry
                        output << node_entry
                    else 
                        output << line
                    end
                end
                end
                %x[cp #{node_file} /tmp/#{node_file}.old]

                File.open("/tmp/new_nodes.pp", "w") do |file|
                    file.puts output 
                end
                reply[:matched] = matched 
                reply[:rc] = 0
                reply[:output] = "Set tags in #{node_file}"
            end
       end
    end
end

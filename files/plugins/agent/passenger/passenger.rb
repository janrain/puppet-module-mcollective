
module MCollective
    module Agent
        class Passenger<RPC::Agent
            def startup_hook
                meta[:license] = "GPL"
                meta[:author] = "Adam Gandelman"
                meta[:version] = "0.1"
                @timeout = 20
            end     
            def touchrestart_action
                touch_restart
            end
            def restartserver_action
                restart_server
            end
            def replay_action
                replay_options
            end
            def help
                <<-EOH
                Used to either touch a restart.txt in the tmp directory of a rails app, or restart the nginx server.
		If tmp directory does not exist, it will be created -- assuming the rails_root exists to begin with. 
                EOH
            end
            
            private 
            def touch_restart
                tmp_dir="#{request[:rails_root]}/tmp"
                tmp_file="#{tmp_dir}/restart.txt"
                if !File.exists?(request[:rails_root])
		    reply[:statusmsg] = "FAILED"
                    reply[:output] = "Rails root does not exist at #{request[:rails_root]}"
                    reply[:rc] = 1
                else
                    if !File.exists?(tmp_dir)
                        Dir.mkdir(tmp_dir)
                        reply[:output] = "Created tmp dir"
                        FileUtils::chown request[:user], nil, tmp_dir 
                    end
                    if File.exists?(tmp_file)
                        File.unlink(tmp_file)
                    end
                    File.open(tmp_file, "w") do |file|
                        file.puts "Created by MCollective - #{Time.now}\n"
                    end             
                    reply[:output] = "Created #{tmp_file} at #{Time.now}"
                    reply[:rc] = 0
                end
            end 
            def restart_server
                restart = %x[/etc/init.d/nginx restart 2>&1]
                if $?.to_i == 0 
	                reply[:output] = "Restarted nginx" 
	                reply[:rc] = 0
		else
			reply[:output] = restart
			reply[:rc] = 1
		end
            end

        end
    end
end

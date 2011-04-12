module MCollective
    module Agent
        class Groupwho<RPC::Agent
            def startup_hook 
                meta[:license] = "Apache License 2.0"
                meta[:author] = "Adam Gandelman"
                meta[:version] = "1.0"
                meta[:url] = "https://github.com/janrain/puppet-module-mcollective"
            end
            def help
                <<-EOH
                Simple user group query agent
                =============================
    
                Query a specific user group, get an array of users.

                INPUT
                    :groups  User group(s)

                OUTPUT
                    :groups Hash of groups. Keys are groupname, value is array of usernames
                EOH
            end
            def querygroup_action
                action_querygroup
            end

            private
            def action_querygroup
                reply[:groups] = Hash.new
                request[:groups].each do |group|
                    reply[:groups][group] = query_group(group)
                end
            end
            def query_group(group)
                %x[cat /etc/group | sed -e 's/:/ /g' | awk '{ print $1 }' | grep #{group} >/dev/null 2>&1]
                rc=$?
                return "Group #{group} does not exist" if rc != 0
                primary_members = Array.new
                gid=%x[cat /etc/group | grep #{group} | sed -e 's/:/ /g' | awk '{ print $3 }'].chomp
                passwd=%x[cat /etc/passwd | grep ":#{gid}:"]
                passwd.each do |line|
                    userline = line.split(":")
                    primary_members << userline[0] if userline[3] == gid
                end
                group=%x[cat /etc/group | grep #{group} | sed -e 's/:/ /g' | awk '{ print $4 }'].chomp
                secondary_members = Array.new
                group.split(",").each do |u|
                #input.each do |u|
                    secondary_members << u
                end
                primary_members | secondary_members
            end
        end
    end
end

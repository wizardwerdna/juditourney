set :application, "juditourney"
set :repository,  "svn+ssh://werdna@pokerwiz.gotdns.com/Users/werdna/svn/juditourney/trunk"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "pokerwiz.gotdns.com"
role :web, "pokerwiz.gotdns.com"
role :db,  "pokerwiz.gotdns.com", :primary => true

set :use_sudo, false
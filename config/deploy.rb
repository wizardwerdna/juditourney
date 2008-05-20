set :user, 'werdna'
set :server, 'lawhacker.com'
set :application, "juditourney" 
set :repository,  "git://github.com/wizardwerdna/juditourney.git"
set :scm, "git"
set :git, "/usr/local/bin/git"
set :user, "werdna"
# set :branch, "origin/master"
# set :deploy_via, :remote_cache
role :web, "lawhacker.com"
role :app, "lawhacker.com"
role :db,  "lawhacker.com", :primary => true

set :deploy_to, "/home/werdna/juditourney" 

task :restart, :roles => :app do
  echo "foo man foo"
  touch "/home/werdna/juditourney/current/tmp/foo.txt"
end

task :after_update_code, :roles => [:web, :db, :app] do
  run "chmod 755 /home/werdna/juditourney/current/public -R" 
end

set :use_sudo, false
set :user, 'werdna'
set :server, 'lawhacker.com'
set :application, "juditourney" 
set :repository,  "git://github.com/wizardwerdna/juditourney.git"
set :scm, "git"
set :git, "/usr/local/bin/git"
set :user, "werdna"
set :branch, "master"
# set :deploy_via, :remote_cache
set :git_shallow_clone, 1
role :web, "lawhacker.com"
role :app, "lawhacker.com"
role :db,  "lawhacker.com", :primary => true

set :deploy_to, "/home/werdna/juditourney" 

set :use_sudo, false

deploy.task :restart, :roles => :app do
end

deploy.task :after_update_code, :roles => [:web, :db, :app] do
end

deploy.task :after_symlink, :roles => [:web, :db, :app] do
  run "chmod 755 /home/werdna/juditourney/current/public -R" 
end
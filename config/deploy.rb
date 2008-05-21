set :application, "juditourney" 
set :server, 'lawhacker.com'
role :web, "lawhacker.com"
role :app, "lawhacker.com"
role :db,  "lawhacker.com", :primary => true

set :scm, "git"
set :git, "/usr/local/bin/git"
set :repository,  "git://github.com/wizardwerdna/juditourney.git"
# set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :branch, "master"
set :real_revision, "HEAD"

set :user, 'werdna'
set :deploy_to, "/home/werdna/juditourney" 
set :use_sudo, false

deploy.task :restart, :roles => :app do
end

deploy.task :after_update_code, :roles => [:web, :db, :app] do
end

deploy.task :after_symlink, :roles => [:web, :db, :app] do
  run "chmod 755 /home/werdna/juditourney/current/public -R" 
end
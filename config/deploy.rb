set :application, "juditourney"
 
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/myapp"
#  
# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :git, "/usr/local/git/bin/git"
set :repository, "git://github.com/wizardwerdna/juditourney.git"
set :branch, "bubbles"
set :deploy_via, :remote_cache
 
set :user, 'werdna'
set :ssh_options, { :forward_agent => true }
 
role :app, "pokerwiz.gotdns.com"
role :web, "pokerwiz.gotdns.com"
role :db,  "pokerwiz.gotdns.com", :primary => true
 
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end


  desc "resolve problems with passenger permissions"
  task :after_symlink, :roles => [:web, :db, :app] do
    run "chmod 755 /home/werdna/juditourney/current/public -R" 
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# 
# set :application, "juditourney" 
# set :server, 'lawhacker.com'
# role :web, "lawhacker.com"
# role :app, "lawhacker.com"
# role :db,  "lawhacker.com", :primary => true
# 
# set :scm, "git"
# set :git, "/usr/local/bin/git"
# set :repository,  "git://github.com/wizardwerdna/juditourney.git"
# # set :deploy_via, :remote_cache
# set :git_shallow_clone, 1
# set :branch, "master"
# set :real_revision, "HEAD"
# 
# set :user, 'werdna'
# set :deploy_to, "/home/werdna/juditourney" 
# set :use_sudo, false
# 
# deploy.task :restart, :roles => :app do
# end
# 
# deploy.task :after_update_code, :roles => [:web, :db, :app] do
# end
# 
# deploy.task :after_symlink, :roles => [:web, :db, :app] do
#   run "chmod 755 /home/werdna/juditourney/current/public -R" 
# end
# 
# 

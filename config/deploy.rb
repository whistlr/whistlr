set :application, 'Whistlr'
set :scm, :git
set :repository, "https://github.com/whistlr/whistlr.git"

set :deploy_to, '/var/www/whistlr.org'
server "198.58.97.33", :web, :app, :db, primary: true
set :user, "timothythehuman"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

require "bundler/capistrano" 

namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    transfer :up, "config/application.yml", "#{shared_path}/application.yml", :via => :scp
  end
 
  desc "Symlink application.yml to the release path"
  task :finalize do
    run "ln -sf #{shared_path}/application.yml #{release_path}/config/application.yml"
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after 'deploy:update_code', 'figaro:setup'
after 'figaro:setup', 'figaro:finalize'
after 'figaro:finalize', 'deploy:migrate'

set :keep_releases, 5
after "deploy:update", "customtasks:customcleanup"

namespace :customtasks do
  task :customcleanup, :except => {:no_release => true} do
    count = fetch(:keep_releases, 5).to_i
    run "ls -1dt #{releases_path}/* | tail -n +#{count + 1} | #{try_sudo} xargs rm -rf"
  end
end
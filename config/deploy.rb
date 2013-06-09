require "bundler/capistrano"
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'

server "175.41.130.195", :web, :app, :db, :primary => true

set :application, "skn1"
set :user, "facoteam"
set :deploy_to, "/home/facoteam/stores/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, "production"

set :repository, "git@github.com:andysher/skn1.git"
set :scm, :git
set :branch, "master"


set :shell, '/bin/bash'

set :rvm_type, :system

default_run_options[:pty]=true
default_run_options[:shell]='/bin/bash --login'
ssh_options[:forward_agent]=true

after 'deploy', 'deploy:cleanup'

namespace :deploy do
        desc "Override deploy:cold to NOT run migrations - there's no database"
        task :cold do
                update
                start
        end
end

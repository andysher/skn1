require "bundler/capistrano"
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'

server "50.57.231.142", :web, :app, :db, :primary => true

set :application, "skn1"
set :user, "facoteam1"
set :deploy_to, "/home/facoteam1/stores/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, "production"

set :repository, "git@github.com:andysher/skn1.git"
set :scm, :git
set :branch, "master"


set :shell, '/bin/bash'

set :rvm_type, :system

default_run_options[:pty]=true
default_run_options[:shell]=false
ssh_options[:forward_agent]=true

after 'deploy', 'deploy:cleanup'

namespace :deploy do
        desc "Override deploy:cold to NOT run migrations - there's no database"
        task :cold do
                update
                start
        end
end

default_run_options[:pty] = true

require 'yaml'

deploy_config = YAML.load_file(File.join('config', 'deploy.yml'))

set :user,              deploy_config['user']
set :domain,            deploy_config['domain']
set :application,       'crisis'
set :repository,        'git://github.com/sabman/Pakistan-Refugee-Crisis.git'
set :deploy_to,         "/home/#{user}/deployments/#{domain}" 
set :deploy_via,        :remote_cache
set :scm,               'git'
set :branch,            'master'
set :git_shallow_clone, 1
set :scm_verbose,       true
set :use_sudo,          false

role :app, domain
role :web, domain
role :db,  domain, :primary => true

database_config = <<-eos
base: &base
  adapter: mysql
  encoding: utf8
  host: #{deploy_config['mysql']['host']}
  username: #{deploy_config['mysql']['user']}
  password: #{deploy_config['mysql']['password']}

production: 
  database: #{deploy_config['mysql']['database']}
  <<: *base
eos

after 'deploy:setup',       'db:generate_yaml'
after 'deploy:update_code', 'db:symlink'

namespace :db do
  task :generate_yaml do
    run "mkdir -p #{shared_path}/config"
    put database_config, "#{shared_path}/config/database.yml"
  end

  task :symlink do 
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

# after 'deploy:setup',       'vendor_gems:install_and_unpack'
# after 'deploy:update_code', 'vendor_gems:symlink'
# 
# namespace :vendor_gems do
#   task :install_and_unpack do
#     run 'gem install sinatra -v 0.9.0.4' # Also installs rack 0.9.1
#     run "cd #{shared_path}/system && gem unpack rack -v 0.9.1 && mv rack-0.9.1 rack"
#     run "cd #{shared_path}/system && gem unpack sinatra -v 0.9.0.4 && mv sinatra-0.9.0.4 sinatra"
#   end
# 
#   task :symlink do
#     run "mkdir -p #{release_path}/vendor/"
#     run "ln -nfs #{shared_path}/system/rack #{release_path}/vendor/rack"
#     run "ln -nfs #{shared_path}/system/sinatra #{release_path}/vendor/sinatra"
#   end
# end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end
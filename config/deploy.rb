set :application, "nufikov_cz"

set :scm, :none

set :user, "deploy"
set :deploy_to, "/opt/apps/#{application}"
set :deploy_via, :copy
set :use_sudo, false

set :repository, "_site"
set :copy_compression, :gzip

server "146.185.169.128", :web, :app, :db, primary: true
set :port, 42222

after "deploy:restart", "deploy:cleanup"

before 'deploy' do
  run_locally 'jekyll clean'
  run_locally 'JEKYLL_ENV=production jekyll build'
end

namespace :deploy do
  task :migrate do
    puts "Skipping migrate."
  end
  task :finalize_update do
    puts "Skipping finalize_update."
  end
  task :start do
    puts "Skipping start."
  end
  task :stop do
    puts "Skipping stop."
  end
  task :restart do
    puts "Skipping restart."
  end
end

# set :ftp_host, "blog.jakubarnold.cz"
# set :password, ""
# set :app_path, File.join(Dir.pwd, "build")
#
# desc "FTP Sync"
# namespace :deploy do
#
#   desc "Sync remote by default"
#   task :default do
#     remote.default
#   end
#
#   namespace :remote do
#     desc "Sync to remote server using lftp"
#     task :sync do
#       `lftp -c "set ftp:list-options -a; open ftp://#{user}:#{password}@#{ftp_host}; lcd #{app_path}; mirror --reverse --delete --use-cache --verbose --allow-chown --allow-suid --no-umask --parallel=2 --exclude-glob .git --exclude-glob *.log"`
#     end
#
#     desc "Sync app to remote server"
#     task :default do
#       self.sync
#     end
#   end
# end

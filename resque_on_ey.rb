# ===== Pre
# https://github.com/defunkt/resque
# http://docs.engineyard.com/appcloud/howtos/configure-and-deploy-resque

# config/resque.yml
development: localhost:6379
test: localhost:6379
edge: localhost:6379

# config/initializers/resque.rb
require 'resque'
require 'resque/server'

rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'

resque_config = YAML.load_file(rails_root + '/config/resque.yml')
Resque.redis = resque_config[rails_env]

# lib/tasks/resque.rb
require 'resque/tasks'

task "resque:setup" => :environment

# resque_x.conf
QUEUE=*


# ========== 1 ==========
# in config.ru

require 'resque/server'
run Rack::URLMap.new \
  "/"       => Songs::Application,
  "/resque" => Resque::Server.new
  
# ========== 2 ==========
# routes.rb
Songs::Application.routes.draw do
  mount Resque::Server.new, :at => "/resque"
  ...
end

# ========== 3 ==========
# http://blog.therubymug.com/blog/2010/04/20/engine-yard-cloud-and-resque-web.html
# application.rb
config.middleware.use 'ResqueWeb'

# lib/resque_web.rb
require 'sinatra/base'
class ResqueWeb < Sinatra::Base
  require 'resque/server'
  use Rack::ShowExceptions
  def call(env)
    if env["PATH_INFO"] =~ /^\/resque/
      env["PATH_INFO"].sub!(/^\/resque/, '')
      env['SCRIPT_NAME'] = '/resque'
      app = Resque::Server.new
      app.call(env)
    else
      super
    end
  end
end 

  
# in your Gemfile
gem 'resque', :require => "resque/server"
gem 'SystemTimer'
gem 'sinatra'


# Monit
# http://community.engineyard.com/discussions/problems/491-monit-status-execution-failed-after-restart
sudo monit summary
sudo monit validate # this can let you get the details

# reply to http://community.engineyard.com/discussions/problems/1683-monit-commands-dont-have-any-impact

# monit: cannot read status from the monit daemon
just wait for a bit


# MySQL server has gone away issue
reconnect: true 
# http://axonflux.com/resque-to-the-rescue-but-a-gotcha-dont-forget
# http://docs.engineyard.com/appcloud/howtos/databases/mysql-troubleshooting



# == References
# http://redistogo.com/documentation/resque
# http://blog.kiskolabs.com/post/776939029/rails3-resque-devise
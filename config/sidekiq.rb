require File.expand_path("../boot.rb", __FILE__)

Sidekiq.configure_server do |config|
##  config.redis = { url: 'redis://127.0.0.1:6379/1', config.redis = ConnectionPool.new(size: 25, &redis_conn) }
  config.redis = { url: 'redis://127.0.0.1:6379/0', concurrency: 25 }
##  config.redis = ConnectionPool.new(size: 25, &redis_conn)
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/0' }
#  config.redis = ConnectionPool.new(size: 5, &redis_conn)
end

# Loads the Padrino applications mounted within the project.
#Padrino.mounted_apps.each do |app|
#  logger.info "=> Loading Padrino Application : #{app.app_class}"
#  app.app_obj.setup_application!
#end

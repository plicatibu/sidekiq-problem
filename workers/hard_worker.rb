class HardWorker
  include Sidekiq::Worker

  def perform(count)

    logger.info "Doing hard work"
    Sidekiq.redis { |c| logger.info "redis location: [#{c.client.location }]" }

    redis_info = Sidekiq.redis { |conn| conn.info }
    logger.info "connected clients: [#{redis_info['connected_clients']}]"

#    sleep count

    i = 0
    while (i < 4000000000)
        i = i + 1
    end

    logger.info "hard work was done"
  end
end

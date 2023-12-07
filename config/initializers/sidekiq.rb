# Sidekiq configuration file (config/sidekiq.yml)

# Concurrency settings
:concurrency: 5

# Redis server location
:queues:
  - default

# Redis configuration
production:
  :url: <%= ENV['REDISCLOUD_URL']%>
  
development:
  :url: redis://localhost:6379/0

# You can add more environment specific settings if required

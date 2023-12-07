if ENV["OPENREDIS_URL"]
    $redis = Redis.new(url: ENV["OPENREDIS_URL"])
  end
  
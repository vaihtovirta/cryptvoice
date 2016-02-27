class ApiKeyAuthentication < Faraday::Middleware
  def call(env)
    env[:request_headers]["X-Api-Key"] = ENV["CRYPTOPAY_API_KEY"]
    @app.call(env)
  end
end

require_relative "#{Rails.root}/app/middleware/api_key_authetication"

Her::API.setup url: ENV["CRYPTOPAY_API_ENDPOINT"] do |connection|
  connection.use ApiKeyAuthentication
  connection.use Faraday::Request::UrlEncoded
  connection.use Her::Middleware::DefaultParseJSON
  connection.use Faraday::Adapter::NetHttp
  connection.use Faraday::Response::Logger if Rails.env.development?
end

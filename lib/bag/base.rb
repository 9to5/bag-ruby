class Bag::Base
  include HTTParty
  base_uri 'bag-api.dev' #Bag::Config.host
  headers 'Accept-Version' => 'v1'
  headers 'Content-Type' => 'application/json'
end

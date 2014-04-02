class Bag::Base
  include HTTParty
  base_uri 'bag-api.dev' #Bag::Config.host
end

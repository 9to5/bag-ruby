class Bag::Base
  include HTTParty
  headers 'Accept-Version' => 'v1'
  headers 'Content-Type' => 'application/json'
end

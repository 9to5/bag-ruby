module Bag
  class Base
    include HTTParty
    headers 'Accept-Version' => 'v0'
    headers 'Content-Type' => 'application/json'
  end
end

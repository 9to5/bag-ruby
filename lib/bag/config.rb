class Bag::Config
  class << self
    attr_accessor :host, :hydra, :bunny_client
  end
end

class Bag::Adres < Bag::Base

  attr_accessor :latitude, :longitude, :straatnaam, :huisnummer, :huisletter, :toevoeging, :postcode, :woonplaats, :gemeente, :provincie

  def initialize(latitude, longitude, postcode, woonplaats, gemeente, provincie, straatnaam, huisnummer, huisletter, toevoeging)
    self.latitude = latitude
    self.longitude = longitude
    self.straatnaam = straatnaam
    self.huisnummer = huisnummer
    self.huisletter = huisletter
    self.toevoeging = toevoeging
    self.postcode = postcode
    self.woonplaats = woonplaats
    self.gemeente = gemeente
    self.provincie = provincie
  end

  def self.search(postcode, huisnummer=nil)
    response = get("/postcodes/#{postcode}", query: huisnummer ? {huisnummer: huisnummer} : {})
    result = []
    if response.success?
      response.each do |obj|
        result << self.new(obj['latitude'], obj['longitude'], obj['postcode'], obj['woonplaats'], obj['gemeente'], obj['provincie'], obj['straatnaam'], obj['huisnummer'], obj['huisletter'], obj['toevoeging'])
      end
    else
      raise JSON.parse(response.parsed_response)['error']
    end
    result
  end
end

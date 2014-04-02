class Bag::Gemeente < Bag::Base

  attr_accessor :gemeentecode, :gemeentenaam

  def initialize(gemeentecode, gemeentenaam)
    self.gemeentecode = gemeentecode
    self.gemeentenaam = gemeentenaam
  end

  def self.reverse_geocode(latitude, longitude)
    response = get("/gemeentes/reverse_geocode.json", query: {longitude: longitude, latitude: latitude})
    if response.success?
      self.new(response["gemeentecode"], response["gemeentenaam"])
    else
      raise response.parsed_response['error']
    end
  end

  def self.find_by_id(id)
    response = get("/gemeentes/#{id}.json")
    if response.success?
      self.new(response["gemeentecode"], response["gemeentenaam"])
    else
      raise response['error']
    end
  end
end

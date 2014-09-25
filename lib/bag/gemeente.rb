class Bag::Gemeente < Bag::Base

  attr_accessor :gemeentecode, :gemeentenaam

  def initialize(gemeentecode, gemeentenaam)
    self.gemeentecode = gemeentecode
    self.gemeentenaam = gemeentenaam
  end

  def self.all
    response = get('/gemeentes')
    result = []
    if response.success?
      response.each do |obj|
        result << self.new(obj['gemeentecode'], obj['gemeentenaam'])
      end
    elsif response.code == 404
      return nil
    else
      raise response.parsed_response['error']
    end
    result
  end

  def self.reverse_geocode(latitude, longitude)
    response = get("/gemeentes/reverse_geocode", query: {longitude: longitude, latitude: latitude})
    if response.success?
      self.new(response['gemeentecode'], response['gemeentenaam'])
    elsif response.code == 404
      return nil
    else
      raise response.parsed_response['error']
    end
  end

  def self.find_by_id(id)
    response = get("/gemeentes/#{URI::encode(id.to_s)}")
    if response.success?
      self.new(response['gemeentecode'], response['gemeentenaam'])
    elsif response.code == 404
      return nil
    else
      raise response.parsed_response['error']
    end
  end
end

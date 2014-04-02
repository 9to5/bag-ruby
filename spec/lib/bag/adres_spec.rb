require 'spec_helper'

describe Bag::Adres do
  it 'should fetch with pc4', :vcr do
    Bag::Adres.search('2611')
  end

  it 'should fetch with pc6', :vcr do
    Bag::Adres.search('2611TS')
  end

  it 'should not fetch with pc6', :vcr do
    expect { Bag::Adres.search('2611XX') }.to raise_error
  end

  it 'should fetch with pc6 and huisnummer', :vcr do
    Bag::Adres.search('2611TS', 88)
  end
end

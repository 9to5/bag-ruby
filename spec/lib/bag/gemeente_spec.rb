require 'spec_helper'

describe Bag::Gemeente do

  it 'should reverse geocode', :vcr do
    Bag::Gemeente.reverse_geocode(52.012895866977814, 4.365448482452786)
  end

  it 'should not reverse geocode', :vcr do
    expect { puts Bag::Gemeente.reverse_geocode(0, 0).inspect }.to raise_error
  end

  it 'should find by name', :vcr do
    Bag::Gemeente.find_by_id('Delft')
  end

  it 'should find by id', :vcr do
    Bag::Gemeente.find_by_id(503)
  end

  it 'should not find by id', :vcr do
    expect { Bag::Gemeente.find_by_id(504) }.to raise_error
  end

  it 'should not find by name', :vcr do
    expect { Bag::Gemeente.find_by_id('Not existing') }.to raise_error
  end
end

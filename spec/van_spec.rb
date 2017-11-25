require 'bike'
require 'docking_station'
require './lib/van'

describe Van do
  it "should allow setting default capacity when initialized" do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
    van = Van.new(100)
    expect(van.capacity).to eq van.capacity
  end


end

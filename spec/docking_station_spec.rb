require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike, :dock)}

  it "realease a bike and it's working" do
    newbike = Bike.new
    subject.dock(newbike)
    expect(subject.release_bike).to eq(newbike)
    expect(newbike.working?).to be(true)
  end

  it 'returns a docked bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to be_a Bike
  end

  it "raise an error" do
    station = DockingStation.new
    expect { station.release_bike}.to raise_error("There are no bikes")
  end

end

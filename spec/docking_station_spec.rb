require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike, :dock)}

  it "release a bike and it's working" do
    newbike = Bike.new
    subject.dock(newbike)
    released_bike = subject.release_bike
    expect(released_bike).to eq(newbike)
    expect(released_bike.working?).to be(true)
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to be_a Array
  end

  describe '#release_bike' do
    it 'releases only as many bikes as there are docked bikes' do
      expect {subject.release_bike}.to raise_error("There are no bikes")
    end
  end
  describe '#dock' do
    it "raise an error message when docking station is full" do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(Bike.new)
      end
      expect {subject.dock(Bike.new)}.to raise_error("Docking station is full")
    end
  end

  # it "should be able to change capacity when necessary" do
  #   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  # end

  it "should be able to set a different capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    docking_station = DockingStation.new(100)
    expect(docking_station.capacity).to eq 100
  end



end

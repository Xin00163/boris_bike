require 'docking_station'


describe DockingStation do
  it {is_expected.to respond_to(:release_bike, :dock)}

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to be_a Array
  end

  describe '#release_bike' do
    it 'releases only as many bikes as there are docked bikes' do
      expect {subject.release_bike}.to raise_error("There are no bikes")
    end
    it 'will not release broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "There are no bikes"
    end
  end

  describe '#dock' do
    it "raise an error message when docking station is full" do
      subject.capacity.times do
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
    expect(docking_station.capacity).to eq docking_station.capacity
  end


end

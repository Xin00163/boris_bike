require 'docking_station'


describe DockingStation do
  it {is_expected.to respond_to(:release_bike, :dock)}


  describe '#release_bike' do
    it 'releases only as many bikes as there are docked bikes' do
      expect {subject.release_bike}.to raise_error("There are no bikes")
    end
    it 'will not release broken bikes' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "There are no bikes"
    end
  end

  describe '#dock' do

    it 'docks a bike' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      expect(subject.dock(bike)).to be_a Array
    end

    it "raise an error message when docking station is full" do
      bike = double(:bike)
      subject.capacity.times do
        allow(bike).to receive(:broken?).and_return(true)
        subject.dock(bike)
      end
      expect {subject.dock(bike)}.to raise_error("Docking station is full")
    end
  end


  it "should be able to set a different capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    docking_station = DockingStation.new(100)
    expect(docking_station.capacity).to eq docking_station.capacity
  end


end

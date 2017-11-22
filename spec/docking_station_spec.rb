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

  it 'releases only as many bikes as there are docked bikes' do
    newbike = Bike.new
    expect(subject.dock(newbike)).to be_a Array
    expect(subject.release_bike).to eq(newbike)
    expect {subject.release_bike}.to raise_error("There are no bikes")
  end

end

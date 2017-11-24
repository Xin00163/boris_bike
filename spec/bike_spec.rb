require "docking_station"

describe Bike do

  it "should report a broken bike" do
    station = DockingStation.new
    station.dock(subject)
    last_bike = station.release_bike
    expect(last_bike.report_broken).to be true
  end


end

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    raise "Docking station is full" if @bikes.length >= 20
    @bikes.push(bike)
  end

  def release_bike
    raise 'There are no bikes' if @bikes.length == 0
    @bikes.pop()
  end


end

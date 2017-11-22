class DockingStation
  attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'There are no bikes' if @bikes.length == 0

    @bikes.pop()
  end

  def dock(bike)
    @bikes.push(bike)
  end


end

class DockingStation
  attr_reader :bike

  def initialize
    @bike = []
  end

  def release_bike
    raise 'There are no bikes' if @bike.length == 0

    @bike.pop()
  end

  def dock(bike)
    @bike.push(bike)
  end


end

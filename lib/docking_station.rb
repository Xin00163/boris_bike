class DockingStation
  attr_reader :bike

  def initialize
    @bike = nil
  end

  def release_bike
    raise 'There are no bikes' if @bike == nil
    @bike
  end

  def dock(bike)
    @bike = bike
  end

end

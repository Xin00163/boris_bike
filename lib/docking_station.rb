require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_reader :capacity


  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def dock(bike)
    raise "Docking station is full" if full?
    bike.broken? ? @broken_bikes << bike : @bikes << bike

  end

  def release_bike
    raise "There are no bikes" if empty?
    @bikes.pop
  end


  private
    def full?
      @bikes.length + @broken_bikes.length >= capacity
    end

    def empty?
      @bikes.empty?
    end
  end

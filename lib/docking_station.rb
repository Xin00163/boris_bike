class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity


  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
      raise "Docking station is full" if full?
      @bikes << bike
    end

    def release_bike
      raise "There are no bikes" if empty?
      @bikes.pop
    end

    private
      def full?
        @bikes.count >= @capacity
      end

      def empty?
        @bikes.empty?
      end
  end

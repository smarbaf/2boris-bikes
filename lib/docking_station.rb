require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike

    fail 'No bikes available' if empty?

    if bikes.each { |bike|
      return bikes.delete(bike) if bike.working? }
      fail "No working bikes available"
    else
      bikes.pop
    end
  end

  def dock(bike)
    fail 'Docking Station Full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end
end

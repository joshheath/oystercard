require_relative 'journey'
require_relative 'station'

class Oystercard
  attr_reader :balance
  attr_accessor :entry_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

def initialize
  @balance = 0
  # @journeys = []
end

def top_up(amount)
  fail "maximum balance of £#{MAXIMUM_BALANCE} exceeded." if amount + @balance > MAXIMUM_BALANCE
  @balance += amount
end

def in_journey?
  !!entry_station
end

def touch_in(entry_station)
  fail "balance is below £#{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
  @journey=Journey.new(entry_station)
  @entry_station = entry_station
  # @journeys << {entry_station: entry_station, exit_station: nil}
end

def touch_out(exit_station)
  deduct(@journey.fare)
  @exit_station = exit_station
  @journey.finish(exit_station)
  # @entry_station = nil
  # @journeys.last[:exit_station] = exit_station
end

def entry_station
  @entry_station
end

def exit_station
  @exit_station
end

private

def deduct(amount)
  @balance -= amount
end

end

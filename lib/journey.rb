require_relative 'oystercard'

class Journey
  attr_reader :balance

  attr_accessor :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  def initialize
    @balance = 0
    @entry_station = nil
  end
  
  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    fail "balance is below £#{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    @entry_station = nil
  end

  def entry_station
    @entry_station
  end

  def exit_station
    @exit_station
  end

  def journeys
    @journeys << journey
  end

end

class Journey
STANDARD_FARE = 1
PENALTY_FARE = 6
attr_reader :entry_station

def initialize(entry_station = "Victoria")
  @entry_station = entry_station
  @journeys = []
  @journeys << {entry_station: entry_station, exit_station: nil}
end

def finish(exit_station)
  @exit_station = exit_station
  # @entry_station = nil
  @journeys.last[:exit_station] = exit_station
  self
end

def complete?
  @entry_station != nil && @exit_station != nil
end

def fare
  STANDARD_FARE
end

def penalty_fare
  PENALTY_FARE
end
end

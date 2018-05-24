class Journey
PENALTY_FARE = 6
attr_reader :entry_station

def initialize(entry_station = "Dalston")
  @entry_station = entry_station
end


def complete?
  @entry_station != nil && @other_station != nil
end

def fare
  1
end

def penalty_fare
  PENALTY_FARE
end

def finish(station)
  @other_station = station
  self
end

end

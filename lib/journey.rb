class Journey
 PENALTY_FARE = 6
 MINIMUM_FARE = 1
 attr_reader :single_journey, :journeys_log, :fare

 def initialize
   @journeys_log = []
   @single_journey = {:entry => nil, :exit => nil}
end

 def start_journey(station)
   @single_journey[:entry] = station
 end

 def calculate_fare
   if @single_journey[:entry] == nil || @single_journey[:exit] == nil
     PENALTY_FARE
   else
     MINIMUM_FARE
   end
 end

 def end_journey(station)
   @single_journey[:exit] = station
   @fare = calculate_fare
   @journeys_log << @single_journey
   @single_journey = {:entry => nil, :exit => nil}
 end
end

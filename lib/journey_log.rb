class JourneyLog
  def initialize(journey_class: Journey.new)
    @journey_log = []
    @journey_class = journey_class
  end
end

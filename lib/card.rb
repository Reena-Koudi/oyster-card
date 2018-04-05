require './lib/journey.rb'
class Card
  LIMIT = 90

  attr_reader :balance

  def initialize(journey)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    fail "Maximum limit of #{LIMIT} reached" if amount + balance > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail 'Minimum balance to touch in' if @balance < Journey::MINIMUM_FARE
    @journey.start_journey(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    deduct(@journey.fare)
  end


  private
  def deduct(amount)
    @balance -= amount
  end
end

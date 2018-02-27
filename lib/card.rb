class Card
  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 5
  attr_reader :balance, :entry_station
  attr_accessor :journeys
  def initialize(limit = LIMIT)
    @balance = 0
    @limit = limit
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum limit of #{LIMIT} reached" if amount + balance > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    fail 'Minimum balance to touch in' if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @journeys.push({entry: @entry_station, exit: exit_station })
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end
  def in_journey?
    @entry_station != nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end

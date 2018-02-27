class Card
  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 5
  attr_reader :balance
  attr_accessor :touch
  def initialize(limit = LIMIT)
    @balance = 0
    @limit = limit
    @touch = false
  end

  def top_up(amount)
    fail "Maximum limit of #{LIMIT} reached" if amount + balance > LIMIT
    @balance += amount
  end

  def touch_in
    fail 'Minimum balance to touch in' if @balance < MINIMUM_BALANCE
    @touch = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @touch = false
  end
  def in_journey?
    @touch
  end
  private
  def deduct(amount)
    @balance -= amount
  end
end

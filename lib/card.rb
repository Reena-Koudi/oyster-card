class Card
  LIMIT = 90
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

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @touch = true
  end

  def touch_out
    @touch = false
  end
  def in_journey?
    @touch
  end
end

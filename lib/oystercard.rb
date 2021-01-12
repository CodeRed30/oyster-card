class Oystercard
  attr_reader :balance, :entry_station

  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def topup(amount)
    raise "Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise "Insufficient funds" if insufficient_funds?

    @entry_station = station
  end

  def touch_out
    @balance -= MINIMUM_FARE
    @entry_station = nil
  end

  def in_journey
    !!entry_station
  end

  private

  def limit_reached?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end
  #
  # def difference
  #   MAXIMUM_BALANCE - @balance
  # end
end

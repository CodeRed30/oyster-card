class Oystercard
  attr_reader :balance, :entry_station, :journeys, :exit_station

  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
    @exit_station = nil
    @journey = { entrance_station: @entry_station, exit_station: @exit_station }
  end

  def topup(amount)
    raise "Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entrance_station)
    raise "Insufficient funds" if insufficient_funds?

    @entry_station = entrance_station
    @journey[:entrance_station] = @entry_station
  end

  def touch_out(exit_station)
    @balance -= MINIMUM_FARE

    @exit_station = exit_station
    @journey[:exit_station] = @exit_station
    @journeys << @journey

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

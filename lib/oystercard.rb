class Oystercard
  attr_reader :balance, :entry_station, :journey_history, :exit_station

  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
    @exit_station = nil
    @journey = { entry_station: @entry_station, exit_station: @exit_station }
  end

  def topup(amount)
    raise "Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if insufficient_funds?
    # if entry station != nil
    # add journey to journey_history and reset entry station
    @entry_station = entry_station
    @journey[:entry_station] = @entry_station
    # journey to journey_history
    #else
    #  @entry_station = entry_station
    # @journey[:entry_station] = @entry_station
    # journey ot journey_history
  end

  def touch_out(exit_station)
    @balance -= MINIMUM_FARE
    #if exit station != nil
    # add journey to journey_history and reset exit station
    @exit_station = exit_station
    @journey[:exit_station] = @exit_station
    # journey to journey_history

    #if journey entry = nil
    @journey_history << @journey
    #else replace exit journey in the journey journey_history
    @entry_station = nil
    @exit_station = nil
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
end

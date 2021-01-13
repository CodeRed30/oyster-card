require_relative 'journey'
require_relative 'station'

class Oystercard
  attr_reader :balance, :journey_history

  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey_history = []
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
    journey_history << Journey.new(entry_station)
  end

  def touch_out(exit_station)
    journey_history[-1].exit_station = exit_station
    @balance -= MINIMUM_FARE
  end

  private

  def limit_reached?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end
end

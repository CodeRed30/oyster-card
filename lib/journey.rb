class Journey
  attr_reader :entry_station
  attr_accessor :exit_station
  def initialize(entry_station = "Not tapped in", exit_station = "Not tapped out")
    @entry_station = entry_station
    @exit_station = exit_station
  end
end

class Ticket
  attr_reader :cost
  attr_accessor :enter_station

  def initialize(cost)
    @cost = cost
  end
end
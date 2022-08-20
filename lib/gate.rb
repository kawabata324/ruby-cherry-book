class Gate
  def initialize(station)
    @station = station
  end

  def enter(ticket)
    ticket.enter_station = @station
  end

  def exit(ticket)
    _enter_station = ticket.enter_station
    _exit_station = @station

    return true if ticket.cost >= 190

    return false if _enter_station == :umeda && _exit_station == :mikuni

    true
  end
end
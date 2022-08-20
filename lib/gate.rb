class Gate
  def initialize(station)
    @station = station
  end

  def enter(ticket)
    # ここで受け取ったticketインスタンスに対して
    # このクラスが保持しているインスタンス情報であるstationを入れてやる
    ticket.enter_station = @station
  end

  def exit(ticket)
    # ここでenterで入っているチケットのstation情報とコストを読み取りさらに
    # 今回インスタンス変数に格納されているstation情報で比較してtrueかfalseを返す
    _enter_station = ticket.enter_station
    _exit_station = @station

    return true if ticket.cost >= 180

    return false if _enter_station == :umeda && _exit_station == :mikuni

    true
  end
end
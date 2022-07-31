class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [160, 180]

  def initialize(name)
    @name = name
  end

  # 引数で渡された切符に自分の駅名を保存する
  def enter(ticket)
    ticket.stamp(@name)
  end

  # exitメソッドではさらに乗車駅と自分の駅名から運賃を割り出す。足りていればtrue 足りていなければfalse
  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end
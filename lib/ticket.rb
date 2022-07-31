class Ticket
  attr_reader :fare, :stamped_at

  def initialize(fare)
    @fare = fare
  end

  # stampというメソッドを用意する。このメソッドに駅名を渡すとその駅名がticketクラスのインスタンスに保存される
  def stamp(name)
    @stamped_at = name
  end

  # 乗車駅を取得する場合はticketクラスのstamped_atメソッドを使う
end
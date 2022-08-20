class Gate
  def initialize(station)
    @station = station
  end

  def enter(ticket)
    # ここで受け取ったticketインスタンスに対して
    # このクラスが保持しているインスタンス情報であるstationを入れてやる
  end

  def exit(ticket)
    # ここでenterで入っているチケットのstation情報とコストを読み取りさらに
    # 今回インスタンス変数に格納されているstation情報で比較してtrueかfalseを返す

    false
  end
end